// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ProtectionBase} from "../../../_utils/ProtectionBase.sol";
import {Storage} from "../../storage/Storage.sol";

contract Initialize is ProtectionBase {
    function initialize(uint256 initialNumber) external initializer {
        Storage.CounterState().number = initialNumber;
    }
}
