# Identity Management using Blockchain

This project implements an Identity Management system using blockchain technology. It leverages Ethereum smart contracts written in Solidity to securely manage identities. The contract is designed to be deployed and tested on the Remix IDE.

## Features

- **Add Identity**: Users can create and add their identity, which includes their name, father's name, and phone number.
- **Update Identity**: Users can update their identity information, but only if they are the owner of that identity.
- **Get Identity**: Users can view their own identity information in plain text. Other users can only see the name, while the father's name and phone number are displayed in a hashed format using Keccak-256 hashing.

## Getting Started

### Tools

- **Remix IDE**: An online integrated development environment for Solidity smart contracts. Access it at [Remix IDE](https://remix.ethereum.org).

## Usage

1. **Deploy the Contract**
   - In [Remix IDE](https://remix.ethereum.org), create a new contract under contracts folder. 
   - Compile the contract by navigating to "Solidity Compiler" tab. 
   - Navigate to the "Deploy & Run Transactions" tab.
   - Choose the appropriate environment (e.g., Remix VM (for ), Injected Web3).
   - Deploy the contract.

2. **Interact with the Contract**:
   - Use the deployed contract's interface in Remix to create, update, and view identities.

Happy coding! 🚀