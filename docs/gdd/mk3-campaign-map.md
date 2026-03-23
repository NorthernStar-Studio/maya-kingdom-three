# Campaign Map Design - Maya Kingdom Three

## Overview

This document defines the campaign map design for Maya Kingdom Three, a 4X strategy game set in pre-Columbian Mesoamerica, the Andes, and Central America. The map serves as the primary gameplay canvas across three historical eras.

**Map Dimensions:** 80 x 60 hexagonal tiles  
**Total Tiles:** 4,800 hexes  
**Era System:** Ancient → Classical → Medieval

---

## Map Regions

### Region Overview

The map is divided into three distinct regions, each representing a major pre-Columbian civilization zone:

| Region | Tile Count | % of Map | Primary Civilization | Geographic Focus |
|--------|------------|----------|---------------------|-------------------|
| Mesoamerica | 1,920 | 40% | Maya, Aztec | Southern Mexico, Guatemala, Belize |
| Andean | 1,680 | 35% | Inca | Peru, Bolivia, Ecuador |
| Central | 1,200 | 25% | City-states | Panama, Costa Rica, Nicaragua |

### Mesoamerica Region

**Bounds:** Western 40% of map  
**Terrain Character:** Tropical jungle, highland valleys, coastal plains

- **Northern Sector:** Arid plains and semi-desert (Yucatán Peninsula simulation)
- **Central Sector:** Dense tropical rainforest (Maya lowland heartland)
- **Southern Sector:** Highland valleys and volcanic mountains (Guatemalan highlands)

**Key Features:**
- Lake system (Lake Atitlán simulation) in highlands
- Major river systems (Usumacinta/Maya rivers)
- Peninsula formations (Yucatán)

### Andean Region

**Bounds:** Eastern 35% of map  
**Terrain Character:** Alpine peaks, highland plateaus, coastal desert

- **Northern Sector:** Cloud forest and mountain foothills (Ecuadorian Andes)
- **Central Sector:** Altiplano plateau and mountain cores (Peruvian highlands)
- **Southern Sector:** High desert and salt flats (Bolivian Altiplano)

**Key Features:**
- Mountain range dividing coast from interior
- Lake Titicaca simulation (high altitude lake)
- Coastal desert strip along western edge

### Central Region

**Bounds:** Southeastern 25% of map  
**Terrain Character:** Tropical lowlands, volcanic foothills, island chains

- **Northern Sector:** Volcanic highlands (Costa Rica/Panama)
- **Southern Sector:** Island chains and coastal lowlands (Panama/isthmus)
- **Eastern Edge:** Caribbean coastal fringe

**Key Features:**
- Volcanic mountain chain
- Narrow isthmus connection
- Island archipelagos (simulating Panama/Colombian islands)

---

## Era-Based Map Changes

The map evolves across three historical eras, reflecting technological, political, and environmental shifts.

### Ancient Era (Turns 1-100)

**Map State:** Primary civilizations emerging

| Feature | State |
|---------|-------|
| Settlements | 12-15 major sites |
| Road Network | None (trails only) |
| Terrain Modifications | Minimal |
| Resources | Raw resources only (no improvements) |
| Visibility | Fog of war active |

**Civilization Distribution:**
- Maya: 4-5 city-states in lowland jungle
- Aztec: Emerging in central highlands (2-3 sites)
- Inca: Early Cusco-based state (2 sites)
- Regional: 6-8 minor cultures

**Notable Sites (Pre-Revealed):**
- Tikal (Maya heartland)
- Teotihuacan (pre-Aztec metropolis)
- Cusco (Inca origin)
- El Mirador (Early Maya mega-site)

### Classical Era (Turns 101-200)

**Map State:** Golden age of civilizations

| Feature | State |
|---------|-------|
| Settlements | 25-30 major cities |
| Road Network | Emergent trade routes |
| Terrain Modifications | Agricultural expansion, terracing |
| Resources | Improved resources active |
| Visibility | Reduced fog of war |

**Map Changes:**
- **New Resources:** Highlands gain terraced farmlands; river valleys developed
- **Settlement Growth:** Cities expand boundaries; outposts established
- **Road Development:** Major trade corridors between civilizations
- **Environmental:** Deforestation visible around major cities

**Civilization Distribution:**
- Maya: Peak territorial extent (10-12 cities)
- Aztec: Dominant empire emerges (8-10 cities)
- Inca: Rapid expansion (6-8 cities)
- Regional: 8-12 minor states

**Notable Additions:**
- Tenochtitlan (new Aztec capital, lake island)
- Chichen Itza (Maya terminal classic)
- Machu Picchu (Inca mountain citadel)
- Calakmul (Maya rival city)

### Medieval Era (Turns 201-300)

**Map State:** Empires and transition

| Feature | State |
|---------|-------|
| Settlements | 30-35 major cities |
| Road Network | Established highway system |
| Terrain Modifications | Significant landscape changes |
| Resources | Advanced improvements |
| Visibility | Mostly explored |

**Map Changes:**
- **Political Shifts:** Maya collapse visible (abandoned cities)
- **Inca Expansion:** Maximum territorial extent reached
- **Aztec Hegemony:** tributary empire at peak
- **Environmental:** Continued deforestation; new agricultural zones

**Civilization Distribution:**
- Maya: Fragmented successor states (4-6 cities)
- Aztec: Maximum empire (12-15 cities)
- Inca: Tawantinsuyu at height (10-12 cities)
- Regional: Diminishing independent cultures

**Notable Changes:**
- Abandoned Maya cities become ruins/landmarks
- Inca road network connects coast to mountains
- New strategic chokepoints from territorial changes

---

## Start Positions

### Maya Start

**Location:** Central Mesoamerica, deep jungle  
**Coordinates:** x:15-20, y:25-32 (central-lowland region)  
**Tile Count:** ~200 tiles control radius

**Starting Terrain:**
- 60% Jungle
- 25% Plains (grassland clearings)
- 15% Hills

**Starting Resources:**
- Jade (luxury)
- Obsidian (strategic)
- Cacao (bonus)
- Deer (bonus)

**Capital Settlement:** "K'awiil" (Maya name, player-customizable)  
**Initial Units:**
- 2 Gatherers (workers)
- 2 Jaguar Warriors
- 1 Scout

**Flavor:** Surrounded by dense rainforest, the Maya begin in the heartland of their civilization, near sites like Tikal and Yaxhá. Starting position emphasizes jungle warfare and defensive terrain advantage.

### Aztec Start

**Location:** Central highlands, lakeside  
**Coordinates:** x:25-30, y:18-24 (central valley)  
**Tile Count:** ~180 tiles control radius

**Starting Terrain:**
- 40% Hills
- 35% Plains
- 25% Forest

**Starting Resources:**
- Obsidian (strategic)
- Cotton (bonus)
- Jaguar (bonus)
- Turkeys (bonus)

**Capital Settlement:** "Tenochtitlan" (pre-generated, or custom)  
**Initial Units:**
- 2 Constructors (workers)
- 2 Jaguar Warriors
- 1 Eagle Knight

**Flavor:** Starting on an island in Lake Texcoco, the Aztecs begin at their historical origin point. The lake provides unique defensive advantages and access to aquatic resources. Floating Garden technology available from turn 1.

### Inca Start

**Location:** Southern Andes, mountain valley  
**Coordinates:** x:55-60, y:35-42 (Cusco region)  
**Tile Count:** ~200 tiles control radius

**Starting Terrain:**
- 50% Mountain
- 30% Hills
- 20% Highland plains

**Starting Resources:**
- Gold (luxury)
- Alpaca (strategic)
- Potato (bonus)
- Quinoa (bonus)

**Capital Settlement:** "Qusqu" (Cusco, pre-generated)  
**Initial Units:**
- 2 Kallpa (workers)
- 2 Slingers
- 1 Chasqui (scout)

**Flavor:** Starting in a high mountain valley, the Inca begin at their historical origin. The position emphasizes highland combat and terrace farming. Mountain terrain provides natural barriers but limits early expansion routes.

---

## Terrain Distribution

### Overall Distribution (80x60 Map = 4,800 Tiles)

| Terrain Type | Tile Count | Percentage | Strategic Value |
|--------------|------------|------------|-----------------|
| Plains | 1,440 | 30% | High (agricultural base) |
| Forest | 960 | 20% | Medium (defense, resources) |
| Jungle | 720 | 15% | High (Maya homeland) |
| Mountain | 720 | 15% | High (chokepoints, Inca homeland) |
| Hills | 480 | 10% | Medium (defensive) |
| Desert | 240 | 5% | Low (coastal Peru) |
| Water (coastal/lake) | 240 | 5% | Medium (Aztec start, trade) |

### Regional Distribution

**Mesoamerica (1,920 tiles):**
- Plains: 35% (672)
- Forest: 25% (480)
- Jungle: 25% (480)
- Hills: 10% (192)
- Water: 5% (96)

**Andean (1,680 tiles):**
- Mountain: 35% (588)
- Plains: 25% (420)
- Hills: 20% (336)
- Desert: 10% (168)
- Forest: 5% (84)
- Water: 5% (84)

**Central (1,200 tiles):**
- Jungle: 25% (300)
- Forest: 25% (300)
- Plains: 20% (240)
- Hills: 15% (180)
- Mountain: 10% (120)
- Water: 5% (60)

### Terrain Combat Modifiers

| Terrain | Defense Bonus | Movement Cost | Special |
|---------|---------------|---------------|---------|
| Mountain | +40% | 2.0 | Impassable for cavalry |
| Hills | +25% | 1.5 | - |
| Jungle | +20% | 1.5 | Hidden units |
| Forest | +15% | 1.25 | - |
| Plains | +0% | 1.0 | - |
| Desert | -10% | 1.0 | Heat attrition |
| Swamp | +15% | 2.0 | Disease risk |

---

## Resources Placement

### Luxury Resources (8 types)

| Resource | Tiles | Primary Regions | Usage |
|----------|-------|-----------------|-------|
| Jade | 12 | Mesoamerica (Maya) | Trade, diplomacy |
| Gold | 15 | Andean (Inca), Mesoamerica | Currency, wealth |
| Obsidian | 20 | Mesoamerica (widespread) | Weapons, trade |
| Turquoise | 8 | Andean (north), Mesoamerica | Trade, religious |
| Seashells | 12 | Coastal regions | Currency, decoration |
| Amber | 6 | Central region | Trade |
| Quetzal Feathers | 8 | Mesoamerica (highlands) | Status, trade |
| Cotton | 15 | All regions | Textiles, trade |

### Strategic Resources (10 types)

| Resource | Tiles | Primary Regions | Strategic Use |
|-----------|-------|-----------------|---------------|
| Iron | 25 | Andean highlands, Central | Weapons, tools |
| Copper | 20 | Andean, Central | Bronze production |
| Salt | 15 | Andean (coast/desert) | Food preservation |
| Alpaca Wool | 12 | Andean highlands | Textiles |
| Cotton | 15 (overlaps) | All regions | Textiles |
| Timber | 40 | Mesoamerica, Central | Construction |
| Stone | 30 | All regions (scattered) | Buildings |
| Pearl | 8 | Coastal (Pacific/Caribbean) | Trade |
| Coral | 6 | Caribbean coast | Trade, luxury |
| Cacao | 20 | Mesoamerica (lowland) | Currency, luxury |

### Bonus Resources (Food/Production)

| Resource | Tiles | Effect | Primary Placement |
|----------|-------|--------|-------------------|
| Maize | 60 | +2 Food | Mesoamerica, Central |
| Potato | 40 | +2 Food | Andean highlands |
| Cassava | 25 | +2 Food | Central, Mesoamerica |
| Fish | 35 | +1 Food | Coastlines, lakes |
| Deer | 30 | +1 Food | Forests, plains |
| Turkey | 20 | +1 Food | Mesoamerica highlands |
| Llama | 15 | +1 Food, +1 Production | Andean plains |
| Quinoa | 20 | +2 Food | Andean highlands |
| Avocado | 25 | +1 Food | Mesoamerica |
| Chili | 30 | +1 Food | All regions |

### Resource Distribution Principles

1. **Historical Accuracy:** Resources placed where historically cultivated
   - Maize/Jade/Obsidian concentrated in Maya heartland
   - Gold/Potato/Llama concentrated in Andean region
   - Cacao along Mesoamerican coast

2. **Strategic Balance:** Each civilization has viable path to victory
   - Each start has 1-2 luxury, 2-3 strategic, 4-5 bonus resources within control range
   - Cross-regional trade routes valuable but optional

3. **Geographic Clustering:** Resources form natural regional economies
   - Coastal resources cluster along ocean/lake edges
   - Mountain resources concentrated in highland zones
   - Jungle resources distributed in forest canopy

4. **Era-Based Unlocks:** Some resources only available in later eras
   - Iron working unlocks in Classical era
   - Bronze working unlocks in Classical era
   - Advanced textiles unlock in Medieval era

---

## Victory Condition Locations

Maya Kingdom Three features four victory paths, each tied to specific geographic locations on the campaign map.

### Religious Victory

**Objective:** Spread religion to all major civilizations

**Key Locations:**

| Location | Region | Significance | Required Action |
|----------|--------|---------------|-----------------|
| Temple of the Sun | Andean | Lake Titicaca sacred site | Build monastery, establish religious base |
| El Castillo | Mesoamerica | Chichen Itza pyramid | Convert Maya holy site |
| Templo Mayor | Mesoamerica | Tenochtitlan religious center | Convert Aztec capital |
| Kukulcan | Mesoamerica | Post-classical Maya site | Spread to successor states |
| Sacred Valley | Andean | Inca spiritual homeland | Convert Inca heartland |

**Mechanic:** Player's religion must be dominant (>50%Followers) in all victory locations simultaneously.

### Domination Victory

**Objective:** Conquer all rival capitals

**Key Locations:**

| Location | Region | Civilization | Starting Power |
|----------|--------|--------------|----------------|
| Qusqu | Andean | Inca | Primary |
| Tenochtitlan | Mesoamerica | Aztec | Primary |
| Tikal | Mesoamerica | Maya | Secondary |
| Cusco Replace | Andean | Inca | Primary |
| Calakmul | Mesoamerica | Maya | Secondary |
| Chichen Itza | Mesoamerica | Maya | Secondary |

**Mechanic:** Capture and hold all primary capitals. Secondary capitals provide bonuses but not required.

### Cultural Victory

**Objective:** Achieve cultural dominance through great works and heritage

**Key Locations:**

| Location | Region | Culture Type | Heritage Value |
|----------|--------|--------------|----------------|
| Copán | Mesoamerica | Maya script/art | High (stelae) |
| Machu Picchu | Andean | Inca architecture | Very High |
| Palenque | Mesoamerica | Maya architecture | High |
| Teotihuacan | Mesoamerica | Pre-classic metropolis | Very High |
| Nazca Lines | Andean | Desert geoglyphs | High |
| Bonampak | Mesoamerica | Maya murals | High |

**Mechanic:** Accumulate heritage points from controlling heritage sites. Must reach threshold while maintaining cultural influence.

### Economic Victory

**Objective:** Dominate trade networks and accumulate wealth

**Key Locations:**

| Location | Region | Trade Type | Trade Value |
|----------|--------|------------|--------------|
| Panama Isthmus | Central | Inter-regional | Very High |
| Lake Trade Route | Mesoamerica | Aztec internal | High |
| Inca Highway | Andean | Road network | Very High |
| Coastal Trade | All | Maritime | High |
| Highland Routes | Andean | Mountain trade | Medium |

**Mechanic:** Establish trade routes, accumulate Gold threshold, control majority of major trade chokepoints.

---

## Map Technical Specifications

### Hex Grid System

- **Hex Type:** Pointy-top hexagons
- **Coordinate System:** Axial coordinates (q, r)
- **Storage:** Array-based tile map
- **Neighbor Calculation:** Offset coordinates for pathfinding

### Fog of War Settings

| Era | Visibility Radius | Exploration Rate |
|-----|-------------------|-------------------|
| Ancient | 3 tiles | 1.0x (slow) |
| Classical | 4 tiles | 1.5x (medium) |
| Medieval | 5 tiles | 2.0x (fast) |

### Performance Targets

- **Minimap Resolution:** 80x60 logical, rendered at various zoom levels
- **Pathfinding:** A* with terrain modifiers, 60 tiles/second minimum
- **Memory:** Map data <50MB, tiles stored as 8-bit type + metadata

### Tile Data Structure

```
Tile {
  terrain_type: uint8
  resource_type: uint8 (optional)
  region: uint8
  elevation: uint8
  improvement: uint8 (era-dependent)
  visibility: uint8
  owner: uint16 (civ ID, 0 if none)
}
```

---

## Design Notes

### Regional Balance Considerations

1. **Maya:** Jungle defense bonus, but slower unit movement. Strong early-game, vulnerable in late.

2. **Aztec:** Central position gives flexibility. Balanced terrain, access to all resources. Strong mid-game.

3. **Inca:** Mountain advantage but isolation risk. Control highland chokepoints. Strong late-game.

### Era Progression Effects

The map transforms meaningfully between eras:
- Ancient: Exploration and founding phase
- Classical: Peak territorial competition
- Medieval: Empire management and decline

### Future Extensibility

The map system supports:
- Additional minor civilizations
- New victory types
- Scenario-specific map variations
- Random map generation based on these templates

---

*Document Version: 1.0*  
*Last Updated: 2026-03-22*  
*Game: Maya Kingdom Three*  
*Status: Campaign Design Specification*