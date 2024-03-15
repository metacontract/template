// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {MCTest} from "mc/devkit/MCTest.sol";
import {MCDevKit} from "mc/devkit/MCDevKit.sol";
// import {DeployLib} from "../../script/DeployLib.sol";
import {ICounter} from "bundle/counter/interfaces/ICounter.sol";
import {Increment} from "bundle/counter/functions/Increment.sol";
import {SetNumber} from "bundle/counter/functions/SetNumber.sol";
import {Initialize} from "bundle/counter/functions/Initialize.sol";
import {CounterFacade} from "bundle/counter/interfaces/CounterFacade.sol";

contract CounterBundleTest is MCTest {
    ICounter public counter;

    function setUp() public {
        // counter = ICounter(mc.deployCounter()); TODO
        // counter = ICounter(mc.init("Counter")
        //             .use("Increment", Increment.increment.selector, address(new Increment()))
        //             .use("Initialize", Initialize.initialize.selector, address(new Initialize()))
        //             .use("SetNumber", SetNumber.setNumber.selector, address(new SetNumber()))
        //             .use("GetNumber", GetNumber.getNumber.selector, address(new GetNumber()))
        //             .set("Counter", address(new CounterFacade()))
        //             .deploy(abi.encodeCall(Initialize.initialize, 1))
        //             .toProxyAddress());
    }

    function test_Success_increment(uint256 fuzzNumber) public {
        // vm.assume(fuzzNumber != type(uint256).max);
        // counter.setNumber(fuzzNumber);

        // counter.increment();

        // assertEq(counter.getNumber(), fuzzNumber + 1);
    }
}
