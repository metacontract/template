// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

abstract contract ProtectionBase {
    /// @dev Write your own reusable protection (e.g., for DAO, for AA wallets, for onlyOwner, for token holders and stakers)

    modifier initializer() {
        _;
    }
}
