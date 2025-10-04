# 🚀 Base NFT Forwarder

This repository contains the smart contract and documentation for a **Badge Forwarder** deployed on the Base network. This unique contract is designed to be fully autonomous: it instantly **mints an ERC-721 badge** as proof of participation and **forwards the deposited funds** directly to the owner's wallet upon receiving a minimum deposit.

## 🔗 Project Details

| Parameter | Value |
| :--- | :--- |
| **Network** | Base Mainnet / Base Sepolia |
| **Contract Name** | `BadgeForwarder` (Minimal ERC-721 + Forwarder) |
| **Owner Address (Your Wallet)** | `0x2A6b5204B83C7619c90c4EB6b5365AA0b7d912F7` |
| **NFT Badge Name** | User Participation Badge (UPB) |
| **Minimum Deposit** | **$0.000001$ ETH** |
| **Contract Address** | *[0x805B8D41f2b8BAbf4f22b070efB608DFF875Bf4F]* |
| **BaseScan Link** | *[https://basescan.org/address/0x805b8d41f2b8babf4f22b070efb608dff875bf4f]* |

---

## 🛠️ Deployment and Verification Settings

The contract was deployed using **Remix IDE**. To successfully verify the source code on BaseScan, you **must** use these exact compiler settings:

| Setting | Value |
| :--- | :--- |
| **Solidity Version** | `0.8.30` |
| **Optimizer Enabled** | **Yes** |
| **Optimizer Runs** | `200` |
| **Constructor Arguments** | None (Empty) |

---

## 💡 User Interaction Guide (Click-Only Deposit)

The user interaction requires only a standard ETH transfer, making it simple and automated. The contract's `receive()` function handles both the minting and forwarding processes simultaneously.

### User Steps to Get a Badge

1.  **Open Wallet:** Open any wallet connected to the Base network (e.g., MetaMask).
2.  **Recipient:** Paste the **Contract Address** into the recipient field.
3.  **Amount:** Input an amount of Base ETH that is **$0.000001$ ETH or higher**.
    * *Note: Sending less than this amount will cause the transaction to fail.*
4.  **Confirm:** Confirm the transaction and pay the gas fee.

### Automated Results on BaseScan

Upon successful transaction confirmation, BaseScan will show two key outcomes:

1.  **NFT Minted:** The transaction's **Events Log** will show a `Transfer` event, confirming that a new **User Participation Badge** NFT has been minted to the user's wallet.
2.  **Funds Forwarded:** An **Internal Transaction** log will show the deposited amount instantly moving from the **Contract Address** to the **Owner Address**.

---

## 📄 Source Code

The Solidity code for the `BadgeForwarder.sol` contract is located in the `contracts/` directory of this repository.

## 📜 License

This project is licensed under the **MIT License**.
