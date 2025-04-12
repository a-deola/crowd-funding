-include .env

.PHONY: deploy-sepolia

clean:
	rm -rf out/ cache/

build:
	forge build
deploy:
	@forge script script/DeployFundMe.s.sol:DeployFundMe $(NETWORK_ARGS)

NETWORK_ARGS := --rpc-url http://localhost:8545 --private-key $(DEFAULT_ANVIL_KEY) --broadcast

deploy-sepolia:
	@echo "Deploying to Sepolia..."
	forge script script/DeployFundMe.s.sol:DeployFundMe --rpc-url $(SEPOLIA_RPC_URL) --broadcast --interactives 1 --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvv
