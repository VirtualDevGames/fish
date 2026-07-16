extends Node

signal host_created()

const LOBBY_TYPE := Steam.LobbyType.LOBBY_TYPE_FRIENDS_ONLY
const MAX_MEMBERS := 4

var peer: SteamMultiplayerPeer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Steam.initRelayNetworkAccess()
	Steam.lobby_created.connect(on_lobby_created)
	Steam.lobby_created.connect(on_lobby_joined)
	Steam.join_requested.connect(on_join_requested)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Steam.run_callbacks()

func host_lobby() -> void:
	# Will cause the "lobby_created" and "lobby_joined" signals to emit
	Steam.createLobby(LOBBY_TYPE, MAX_MEMBERS)
 
# Called after creating a lobby locally
func on_lobby_created(connect: int, lobby_id: int) -> void:
	# We created the lobby, so we act as server host
	if connect == Steam.RESULT_OK:
		peer = SteamMultiplayerPeer.new()
		peer.server_relay = true
		peer.create_host()
		multiplayer.multiplayer_peer = peer
		host_created.emit()

# Called when joining a lobby (after creating the lobby or joining a friend)
func on_lobby_joined(lobby_id: int, permissions: int, locked: bool, response: int) -> void:
	if response == Steam.CHAT_ROOM_ENTER_RESPONSE_SUCCESS:
		# If we created the lobby, we are already hosting, so we should not create a new client peer
		if Steam.getLobbyOwner(lobby_id) == Steam.getSteamID():
			return
		peer = SteamMultiplayerPeer.new()
		peer.server_relay = true
		peer.create_client(Steam.getLobbyOwner(lobby_id))
		multiplayer.multiplayer_peer = peer

func on_join_requested(lobby_id: int, steam_id: int) -> void:
	# Will cause "lobby_joined" signal to emit
	Steam.joinLobby(lobby_id)
