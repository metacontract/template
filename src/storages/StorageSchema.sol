// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

bytes32 constant COUNTER_STORAGE_LOCATION = 0xbd4ccb9f79928978b4065163b0b26bcf628c563a4ae8d1706d1e0ae6c1c66d00;

interface StorageSchema {
    /// @custom:storage-location erc7201:mc.count.counter
    struct Counter {
        uint256 number;
    }
}
