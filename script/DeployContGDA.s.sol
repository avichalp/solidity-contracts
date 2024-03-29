// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/GDA/ContGDA.sol";

contract MyContGDA is ContGDA {
  constructor(
    string memory _name,
    string memory _symbol,
    int256 _initialPrice,
    int256 _scalerFactor,
    int256 _decayConstant
  ) ContGDA(_name, _symbol, _initialPrice, _scalerFactor, _decayConstant) {}
}

contract CGDAScript is Script {
  ContGDA public gda;

  // k = 10
  int256 public initialPrice = 10e18;
  // lambda = 1/2
  int256 public decayConstant = 5e17;
  // r = 1
  int256 public emissionRate = 1e18;

  function setUp() public {}

  function run() public {
    uint256 deployerPrivateKey = vm.envUint("GOERLI_PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);

    new MyContGDA("MyCGDA", "MCGDA", initialPrice, emissionRate, decayConstant);

    vm.stopBroadcast();
  }
}
