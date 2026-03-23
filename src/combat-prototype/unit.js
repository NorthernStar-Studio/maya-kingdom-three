/**
 * Unit - Base class for combat units (players, enemies)
 */

class Unit {
    constructor(config) {
        this.name = config.name || "Unknown";
        this.maxHp = config.maxHp || 100;
        this.hp = config.hp || this.maxHp;
        this.maxMp = config.maxMp || 50;
        this.mp = config.mp || this.maxMp;
        this.attack = config.attack || 10;
        this.defense = config.defense || 5;
        this.speed = config.speed || 10;
        this.level = config.level || 1;
        
        this.isDefending = false;
        this.isAlive = true;
        this.statusEffects = [];
        
        // Skills available to this unit
        this.skills = config.skills || [];
    }

    /**
     * Check if unit is alive
     */
    isAlive() {
        return this.hp > 0 && this.isAlive;
    }

    /**
     * Take damage
     */
    takeDamage(amount) {
        // Apply defense reduction
        const actualDamage = Math.max(1, amount - this.defense);
        this.hp = Math.max(0, this.hp - actualDamage);
        
        if (this.hp <= 0) {
            this.isAlive = false;
            this.onDeath();
        }
        
        return actualDamage;
    }

    /**
     * Heal the unit
     */
    heal(amount) {
        const actualHeal = Math.min(amount, this.maxHp - this.hp);
        this.hp = Math.min(this.maxHp, this.hp + amount);
        return actualHeal;
    }

    /**
     * Use MP
     */
    useMp(cost) {
        if (this.mp >= cost) {
            this.mp -= cost;
            return true;
        }
        return false;
    }

    /**
     * Apply a status effect
     */
    addStatusEffect(effect) {
        this.statusEffects.push(effect);
    }

    /**
     * Remove a status effect
     */
    removeStatusEffect(effectName) {
        this.statusEffects = this.statusEffects.filter(e => e.name !== effectName);
    }

    /**
     * Process status effects at turn start
     */
    processStatusEffects() {
        for (let i = this.statusEffects.length - 1; i >= 0; i--) {
            const effect = this.statusEffects[i];
            
            if (effect.damage) {
                this.takeDamage(effect.damage);
            }
            if (effect.heal) {
                this.heal(effect.heal);
            }
            
            effect.duration--;
            if (effect.duration <= 0) {
                this.statusEffects.splice(i, 1);
            }
        }
    }

    /**
     * Called when turn starts
     */
    onTurnStart() {
        this.isDefending = false;
        this.processStatusEffects();
    }

    /**
     * Called when turn ends
     */
    onTurnEnd() {
        // Regenerate some MP at end of turn
        this.mp = Math.min(this.maxMp, this.mp + 5);
    }

    /**
     * Called when unit dies
     */
    onDeath() {
        this.isAlive = false;
    }

    /**
     * Get a summary of the unit's state
     */
    getState() {
        return {
            name: this.name,
            hp: this.hp,
            maxHp: this.maxHp,
            mp: this.mp,
            maxMp: this.maxMp,
            attack: this.attack,
            defense: this.defense,
            speed: this.speed,
            level: this.level,
            isAlive: this.isAlive(),
            isDefending: this.isDefending,
            statusEffects: this.statusEffects.map(e => e.name)
        };
    }

    /**
     * Check if unit can act
     */
    canAct() {
        return this.isAlive();
    }
}

/**
 * PlayerUnit - Extended unit for player characters
 */
class PlayerUnit extends Unit {
    constructor(config) {
        super(config);
        this.isPlayer = true;
    }

    onTurnStart() {
        super.onTurnStart();
        // Player can choose actions
    }
}

/**
 * EnemyUnit - Extended unit for enemies
 */
class EnemyUnit extends Unit {
    constructor(config) {
        super(config);
        this.isPlayer = false;
        this.aiBehavior = config.aiBehavior || 'basic';
    }

    onTurnStart() {
        super.onTurnStart();
    }

    /**
     * Get AI action for this turn
     */
    getAIAction(battle) {
        const playerUnits = battle.playerUnits.filter(u => u.isAlive());
        
        if (!playerUnits.length) {
            return { type: 'end' };
        }

        // Basic AI: attack lowest HP target
        const target = playerUnits.reduce((lowest, unit) => 
            unit.hp < lowest.hp ? unit : lowest
        );

        return {
            type: 'attack',
            target: target,
            damage: this.attack
        };
    }
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = { Unit, PlayerUnit, EnemyUnit };
}
