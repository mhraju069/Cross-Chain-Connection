# Cross-Chain-Connection# Cross-Chain Messaging Practice (Ethereum ↔ Polygon)

This repository contains my **first hands-on practice project for cross-chain communication using Solidity**.  
The goal of this project is to understand how smart contracts can send and receive messages across different blockchains using a router-based architecture.

> ⚠️ This is a learning project and **not production-ready**.

---

## 🧠 Project Overview

The project demonstrates a simple cross-chain workflow:

1. A contract on **Ethereum (Sepolia testnet)** sends two numbers to a contract on **Polygon**.
2. The Polygon contract:
   - Receives the message
   - Calculates the sum of the two numbers
   - Sends the result back to Ethereum
3. The Ethereum contract receives and stores the result.

This helps illustrate the **basic mechanics of cross-chain messaging**, payload encoding/decoding, and router-based message delivery.

---

## 📂 Contracts

### `ICrossChainRouter.sol`
An interface that represents a generic cross-chain router responsible for sending messages between chains.

```solidity
function sendMessage(
    uint256 chainId,
    address receiver,
    bytes calldata data
) external payable;
