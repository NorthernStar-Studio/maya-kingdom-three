/**
 * Combat Engine - Turn-based combat system prototype
 * Handles the core combat logic, turn ordering, and combat resolution
 */

class CombatEngine {
    constructor(battle) {
        this.battle = battle;
        this.turnQueue = [];
        this.currentTurn = 0;
        this.isCombatActive = false;
    }

    /**
     * Initialize combat and determine turn order
     */
    startCombat() {
        this.isCombatActive = true;
        this.currentTurn = 0;
        this.determineTurnOrder();
        this.battle.log("Combat started!");
        return this.nextTurn();
    }

    /**
     * Determine turn order based on unit speed
     */
    determineTurnOrder() {
        const allUnits = [...this.battle.playerUnits, ...this.battle.enemyUnits];
        allUnits.sort((a, b) => b.speed - a.speed);
        this.turnQueue = allUnits;
        this.currentTurn = 0;
    }

    /**
     * Get the current unit whose turn it is
     */
    getCurrentUnit() {
        if (!this.turnQueue.length) return null;
        return this.turnQueue[this.currentTurn % this.turnQueue.length];
    }

    /**
     * Advance to the next turn
     */
    nextTurn() {
        this.currentTurn++;
        const unit = this.getCurrentUnit();
        
        if (unit) {
            unit.onTurnStart();
            this.battle.log(`${unit.name}'s turn`);
        }
        
        return unit;
    }

    /**
     * Execute an action by a unit
     */
    executeAction(action) {
        const attacker = this.getCurrentUnit();
        if (!attacker) return { success: false, error: "No active unit" };

        const { type, target, damage, effects } = action;

        if (type === 'attack') {
            return this.executeAttack(attacker, target, damage);
        } else if (type === 'defend') {
            return this.executeDefend(attacker);
        } else if (type === 'skill') {
            return this.executeSkill(attacker, target, effects);
        }

        return { success: false, error: "Unknown action type" };
    }

    /**
     * Execute an attack action
     */
    executeAttack(attacker, target, baseDamage) {
        if (!target || !target.isAlive()) {
            return { success: false, error: "Invalid target" };
        }

        // Calculate damage using damage engine
        const damage = this.battle.damageEngine.calculateDamage(
            attacker, target, baseDamage
        );

        target.takeDamage(damage);
        this.battle.log(`${attacker.name} attacks ${target.name} for ${damage} damage!`);

        // Check if target is defeated
        if (!target.isAlive()) {
            this.battle.log(`${target.name} has been defeated!`);
            this.battle.onUnitDefeated(target);
        }

        return { success: true, damage, target: target.name };
    }

    /**
     * Execute a defend action
     */
    executeDefend(unit) {
        unit.isDefending = true;
        this.battle.log(`${unit.name} takes a defensive stance!`);
        return { success: true, action: 'defend' };
    }

    /**
     * Execute a skill action
     */
    executeSkill(attacker, target, effects) {
        if (!target && effects.targetSelf) {
            target = attacker;
        }

        if (target && effects.damage) {
            const damage = this.battle.damageEngine.calculateDamage(
                attacker, target, effects.damage
            );
            target.takeDamage(damage);
            this.battle.log(`${attacker.name} uses ${effects.name} on ${target.name} for ${damage} damage!`);
        }

        if (target && effects.heal) {
            target.heal(effects.heal);
            this.battle.log(`${attacker.name} heals ${target.name} for ${effects.heal} HP!`);
        }

        return { success: true, action: 'skill', effects };
    }

    /**
     * End the current unit's turn
     */
    endTurn() {
        const unit = this.getCurrentUnit();
        if (unit) {
            unit.onTurnEnd();
        }
        return this.nextTurn();
    }

    /**
     * Check combat end conditions
     */
    checkCombatEnd() {
        const playerAlive = this.battle.playerUnits.some(u => u.isAlive());
        const enemyAlive = this.battle.enemyUnits.some(u => u.isAlive());

        if (!playerAlive) {
            this.isCombatActive = false;
            return { result: 'defeat', message: "You have been defeated!" };
        }

        if (!enemyAlive) {
            this.isCombatActive = false;
            return { result: 'victory', message: "Victory!" };
        }

        return { result: 'ongoing' };
    }

    /**
     * Get combat state
     */
    getState() {
        return {
            isActive: this.isCombatActive,
            currentTurn: this.currentTurn,
            currentUnit: this.getCurrentUnit()?.name,
            playerUnits: this.battle.playerUnits.map(u => u.getState()),
            enemyUnits: this.battle.enemyUnits.map(u => u.getState())
        };
    }
}

if (typeof module !== 'undefined' && module.exports) {
    module.exports = CombatEngine;
}
