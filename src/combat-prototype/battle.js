/**
 * Battle - Manages a complete battle encounter
 * Coordinates between combat engine, units, and damage calculations
 */

const { CombatEngine } = require('./combat-engine.js');
const { Unit, PlayerUnit, EnemyUnit } = require('./unit.js');

class Battle {
    constructor(config = {}) {
        this.name = config.name || "Battle";
        this.playerUnits = [];
        this.enemyUnits = [];
        this.combatLog = [];
        
        // Initialize damage engine (inline for prototype)
        this.damageEngine = {
            calculateDamage: (attacker, target, baseDamage) => {
                // Apply attacker's attack stat
                let damage = baseDamage * (attacker.attack / 10);
                
                // Apply critical hit chance (10%)
                if (Math.random() < 0.1) {
                    damage *= 1.5;
                    attacker.lastAttackWasCritical = true;
                } else {
                    attacker.lastAttackWasCritical = false;
                }
                
                // Apply target's defense
                damage = Math.max(1, damage - target.defense);
                
                // Apply defending bonus
                if (target.isDefending) {
                    damage = Math.floor(damage / 2);
                }
                
                return Math.floor(damage);
            }
        };
        
        this.combatEngine = new CombatEngine(this);
        this.turnCount = 0;
    }

    /**
     * Add a player unit to the battle
     */
    addPlayerUnit(unit) {
        if (unit instanceof Unit) {
            this.playerUnits.push(unit);
        }
    }

    /**
     * Add an enemy unit to the battle
     */
    addEnemyUnit(unit) {
        if (unit instanceof Unit) {
            this.enemyUnits.push(unit);
        }
    }

    /**
     * Initialize and start the battle
     */
    start() {
        this.log(`=== ${this.name} ===`);
        this.log(`Player units: ${this.playerUnits.map(u => u.name).join(', ')}`);
        this.log(`Enemy units: ${this.enemyUnits.map(u => u.name).join(', ')}`);
        
        return this.combatEngine.startCombat();
    }

    /**
     * Execute an action for the current unit
     */
    executeAction(action) {
        const result = this.combatEngine.executeAction(action);
        
        // Check for combat end
        const endResult = this.combatEngine.checkCombatEnd();
        if (endResult.result !== 'ongoing') {
            this.log(endResult.message);
            this.endCombat(endResult.result);
        }
        
        return result;
    }

    /**
     * Execute player action
     */
    playerAction(type, target, options = {}) {
        const currentUnit = this.combatEngine.getCurrentUnit();
        
        if (!currentUnit || !currentUnit.isPlayer) {
            return { success: false, error: "Not player's turn" };
        }

        let action = { type };
        
        if (type === 'attack') {
            action.target = target;
            action.damage = options.damage || currentUnit.attack;
        } else if (type === 'defend') {
            // No additional options needed
        } else if (type === 'skill') {
            action.target = target;
            action.effects = options.effects;
        }
        
        return this.executeAction(action);
    }

    /**
     * Execute enemy AI turn
     */
    executeEnemyTurn() {
        const currentUnit = this.combatEngine.getCurrentUnit();
        
        if (!currentUnit || currentUnit.isPlayer) {
            return { success: false, error: "Not enemy's turn" };
        }

        if (currentUnit instanceof EnemyUnit) {
            const action = currentUnit.getAIAction(this);
            return this.executeAction(action);
        }
        
        return { success: false, error: "Invalid enemy unit" };
    }

    /**
     * End current turn
     */
    endTurn() {
        this.turnCount++;
        return this.combatEngine.endTurn();
    }

    /**
     * Called when a unit is defeated
     */
    onUnitDefeated(unit) {
        this.log(`${unit.name} was defeated!`);
    }

    /**
     * End combat
     */
    endCombat(result) {
        this.log(`=== Combat ended: ${result.toUpperCase()} ===`);
        return result;
    }

    /**
     * Add message to combat log
     */
    log(message) {
        this.combatLog.push({
            turn: this.turnCount,
            message: message,
            timestamp: Date.now()
        });
        console.log(`[Battle] ${message}`);
    }

    /**
     * Get current battle state
     */
    getState() {
        return {
            name: this.name,
            turn: this.turnCount,
            combatEngine: this.combatEngine.getState(),
            combatLog: this.combatLog,
            result: this.combatEngine.checkCombatEnd()
        };
    }

    /**
     * Get all available actions for current unit
     */
    getAvailableActions() {
        const unit = this.combatEngine.getCurrentUnit();
        if (!unit) return [];

        const actions = [
            { type: 'attack', name: 'Attack', description: 'Basic attack' },
            { type: 'defend', name: 'Defend', description: 'Reduce incoming damage' }
        ];

        // Add skills
        for (const skill of unit.skills) {
            actions.push({
                type: 'skill',
                name: skill.name,
                description: skill.description,
                cost: skill.mpCost,
                effects: skill.effects
            });
        }

        return actions;
    }

    /**
     * Get valid targets for an action
     */
    getValidTargets(actionType) {
        if (actionType === 'attack' || actionType === 'skill') {
            const currentUnit = this.combatEngine.getCurrentUnit();
            if (currentUnit && currentUnit.isPlayer) {
                return this.enemyUnits.filter(u => u.isAlive());
            } else {
                return this.playerUnits.filter(u => u.isAlive());
            }
        }
        return [];
    }
}

// Export for module usage
if (typeof module !== 'undefined' && module.exports) {
    module.exports = Battle;
}

// Example usage when run directly
if (typeof require !== 'undefined' && require.main === module) {
    console.log('=== Combat Prototype Demo ===\n');
    
    // Create a battle
    const battle = new Battle({ name: "Forest Encounter" });
    
    // Add player units
    battle.addPlayerUnit(new PlayerUnit({
        name: "Hero",
        maxHp: 100,
        attack: 15,
        defense: 8,
        speed: 12,
        skills: [
            { name: "Heal", mpCost: 10, effects: { heal: 30, targetSelf: true }, description: "Restore 30 HP" },
            { name: "Fire Strike", mpCost: 15, effects: { damage: 25 }, description: "Fire attack for 25 damage" }
        ]
    }));
    
    // Add enemy units
    battle.addEnemyUnit(new EnemyUnit({
        name: "Goblin",
        maxHp: 40,
        attack: 8,
        defense: 3,
        speed: 10,
        aiBehavior: 'aggressive'
    }));
    
    battle.addEnemyUnit(new EnemyUnit({
        name: "Orc",
        maxHp: 60,
        attack: 12,
        defense: 5,
        speed: 6,
        aiBehavior: 'aggressive'
    }));
    
    // Start battle
    battle.start();
    
    // Simulate a few turns
    console.log('\n--- Turn 1: Player attacks Goblin ---');
    battle.playerAction('attack', battle.enemyUnits[0], { damage: 15 });
    battle.endTurn();
    
    console.log('\n--- Turn 2: Enemy AI ---');
    battle.executeEnemyTurn();
    battle.endTurn();
    
    console.log('\n--- Turn 3: Player uses Fire Strike ---');
    battle.playerAction('skill', battle.enemyUnits[1], { 
        effects: { name: "Fire Strike", damage: 25 } 
    });
    battle.endTurn();
    
    console.log('\n--- Turn 4: Enemy AI ---');
    battle.executeEnemyTurn();
    battle.endTurn();
    
    console.log('\n--- Final State ---');
    console.log(JSON.stringify(battle.getState(), null, 2));
}
