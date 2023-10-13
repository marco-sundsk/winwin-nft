# winwin-nft

## Development

1. Install `rustup` via https://rustup.rs/
2. Run the following:

```
rustup default stable
rustup target add wasm32-unknown-unknown
```

### Compiling

Run the following:

```
make
```

### Testing

Run the following:
```
make test
```
### Deploying to TestNet

To deploy to TestNet, you can use next command:
```
near dev-deploy
```

This will output on the contract ID it deployed.

## Interfaces
init contract
```
near call $WWN new_default_meta '{"owner_id": "'$OWNER'"}' --account_id=$WWN
```

view nft metadata
```
near view $WWN nft_metadata
```

view and reset owner 
```
near view $WWN get_owner
near call $WWN set_owner '{"owner_id": "'$NEWOWNER'"}' --account_id=$OWNER --depositYocto=1
```

mint nft
```
# would return token info where token id is included.
near call $WWN wwn_mint '{"receiver_id": "alice.testnet", "media_url": "https://iili.io/lvWL0l.md.png"}' --account_id=$OWNER --amount=0.1
```

transfer nft
```
near call $WWN nft_transfer '{"receiver_id": "bob.testnet", "token_id": "1"}' --account_id=alice.testnet --depositYocto=1
```