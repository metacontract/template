// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ICounter {
    function initialize(uint256 initialNumber) external;
    function getNumber() external view returns(uint256);
    function increment() external;
    function setNumber(uint256 newNumber) external;
}
