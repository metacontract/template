// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ICounter {
    function increment() external;
    function initialize(uint256 initialNumber) external;
    function setNumber(uint256 newNumber) external;
}
