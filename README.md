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
   ```

PolygonSUM.sol

Deployed on Polygon network.

Responsibilities:

Receives two numbers from another chain

Computes their sum

Sends the result back to the sender on Ethereum

Key Functions:

MakeSum(uint256 a, uint256 b) – Internal pure function to calculate the sum

recieveMessage(bytes calldata data) – Decodes incoming payload and sends the result back

SendValue.sol

Deployed on Ethereum (Sepolia testnet).

Responsibilities:

Sends two numbers to the Polygon contract

Receives the calculated sum from Polygon

Stores the result on-chain

Key Functions:

SendValueToPolygon(uint256 a, uint256 b, address polygonAddress)

recieveMessage(bytes calldata data)
```
🔁 Cross-Chain Flow
Ethereum (SendValue)
   |
   |  sendMessage(a, b, sender)
   ↓
Polygon (PolygonSUM)
   |
   |  calculate sum
   |
   |  sendMessage(result)
   ↓
Ethereum (SendValue)
```
🛠 Technologies Used

Solidity ^0.8.0

ABI Encoding / Decoding

Cross-chain Router Interface

Ethereum (Sepolia Testnet)

Polygon Network

🎯 Learning Goals

Understand cross-chain messaging basics

Practice ABI encoding/decoding

Learn how routers facilitate inter-chain communication

Gain experience designing simple cross-chain workflows

🚧 Limitations

No access control on recieveMessage

No message validation or replay protection

No gas or fee handling logic

Router implementation is assumed and abstracted

📌 Disclaimer

This project is for educational purposes only.
Do not use this code in production environments without proper security reviews and improvements.

🙌 Feedback

As this is my first cross-chain project, feedback and suggestions are very welcome!


