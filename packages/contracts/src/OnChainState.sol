// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.8;

import "suave-std/Suapp.sol";
import "suave-std/suavelib/Suave.sol";

contract OnChainState is Suapp {
    uint64 public state;

    event UpdateState(string message);
    event NewState(uint64 newState);

    function onchain() public emitOffchainLogs {
        state++;
        emit NewState(state);
    }

    function offchain() public returns (bytes memory) {
        require(Suave.isConfidential());
        emit UpdateState("Do compute offchain, and any states updates in onchain callbacks");
        return abi.encodeWithSelector(this.onchain.selector);
    }

    function failure() public returns (bytes memory) {
        require(Suave.isConfidential());
        state++;
        emit UpdateState("You cannot modify state storage using offchain functions");
        return abi.encodeWithSelector(this.onchain.selector);
    }
}
