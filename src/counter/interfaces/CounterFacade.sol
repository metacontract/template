// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./ICounter.sol";

contract CounterFacade is ICounter {
    function increment() external {}
    function initialize(uint256 initialNumber) external {}
    function setNumber(uint256 newNumber) external {}
}
