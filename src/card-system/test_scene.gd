extends Node2D

var platform_context: PlatformContext

@onready var card_manager: CardManager = $CardManager
@onready var hand_display: Control = $HandDisplay

func _ready():
	platform_context = PlatformContext.new()
	platform_context.initialize()
	add_child(platform_context)
	card_manager.apply_config(platform_context.config)
	_setup_test_deck()
	card_manager.draw_cards(platform_context.config.starting_hand_size)

func _setup_test_deck():
	var test_cards: Array[Card] = []
	
	for i in range(20):
		var card = Card.new()
		card.id = "card_%d" % i
		card.name = "Card %d" % i
		card.description = "Test card number %d" % i
		card.cost = 1
		card.value = randi() % 10 + 1
		test_cards.append(card)
	
	card_manager.initialize_deck(test_cards)

func _input(event):
	match platform_context.input_router.resolve_event(event):
		InputRouter.Command.CONFIRM:
			card_manager.draw_cards(1)
		InputRouter.Command.CANCEL:
			if card_manager.hand.get_hand_size() > 0:
				card_manager.discard_from_hand(0)
		_:
			pass
