// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ICounter {
    function setNumber(uint256 newNumber) external;
    function increment() external;
}
