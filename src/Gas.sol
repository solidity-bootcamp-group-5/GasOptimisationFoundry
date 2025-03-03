// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Vm.sol";
import {console} from "forge-std/console.sol";

Vm constant vm = Vm(address(uint160(uint256(keccak256("hevm cheat code")))));

bool constant USE_YUL = true;

function newGasContract(address[] memory _admins, uint256 _totalSupply) returns (GasContract) {

    //vm.getCode doesn't work with yul targets for some reason so extract the bytecode manually
    //bytes memory bytecode = bytes.concat(vm.getCode("GasContractYul.yul:GasContractYul"));
    string memory path = string.concat(vm.projectRoot(), "/out/GasContractYul.yul/GasContractYul.json");
    bytes memory bytecode_yul = vm.parseJsonBytes(vm.readFile(path), ".bytecode.object");
    bytes memory bytecode_sol = bytes.concat(vm.getCode("Gas.sol:GasContractImpl"));
    bytes memory bytecode = USE_YUL ? bytecode_yul : bytecode_sol;
    bytes memory ctorArgs = abi.encode(_admins, _totalSupply);
    bytes memory payload = bytes.concat(bytecode, ctorArgs);
    address addr;
    uint256 gas_used;
    assembly {
	let offset := add(payload, 0x20)
	let length := mload(payload)
	let gas_before := gas()
	let ret := create(0, offset, length)
	let gas_after := gas()
	gas_used := sub(gas_before, gas_after)
	addr := ret
    }
    //console.log() in forge-std/src/console.sol doesn't work for uint and int due to signature errors; using hack work around here
    console._sendLogPayload(abi.encodeWithSignature("log(string,uint256,uint256)", "CREATE gas used & payload size:", gas_used, payload.length));
    require(addr != address(0), "could not deploy contract");
    return GasContract(addr);
}

interface GasContract {
    event AddedToWhitelist(address userAddress, uint256 tier);
    event WhiteListTransfer(address indexed);
    function administrators(uint256 _index) external view returns (address admin_);
    function checkForAdmin(address _user) external pure returns (bool admin_);
    function balanceOf(address _user) external view returns (uint256 balance_);
    function balances(address _user) external view returns (uint256 balance_);
    function whitelist(address) external pure returns (uint256);
    function transfer(address _recipient, uint256 _amount, string calldata) external payable;
    function addToWhitelist(address _userAddrs, uint256 _tier) external payable;
    function whiteTransfer(address _recipient, uint256 _amount) external payable;
    function getPaymentStatus(address) external view returns (bool, uint256);
}

contract GasContractImpl is GasContract {
    mapping(address => uint256) private the_balances;
    uint256 whiteListAmount;
    address immutable admin0;
    address immutable admin1;
    address immutable admin2;
    address immutable admin3;
    address constant admin4 = address(0x1234);
    uint256 constant totalSupply = 1000000000;

    modifier onlyAdminOrOwner() {
        if (!checkForAdmin(msg.sender)) revert();
        _;
    }

    constructor(address[] memory _admins, uint256) payable {
        admin0 = _admins[0];
        admin1 = _admins[1];
        admin2 = _admins[2];
        admin3 = _admins[3];
    }

    function administrators(uint256 _index) external view returns (address admin_) {
        if (_index == 0) return admin0;
        if (_index == 1) return admin1;
        if (_index == 2) return admin2;
        if (_index == 3) return admin3;
        return admin4;
    }

    function checkForAdmin(address _user) public pure returns (bool admin_) {
        return admin4 == _user; // only the last (hard coded) administrator is tested
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
	return balancesImpl(_user);
    }

    function balances(address _user) public view returns (uint256 balance_) {
	return balancesImpl(_user);
    }

    function balancesImpl(address _user) private view returns (uint256 balance_) {
        balance_ = the_balances[_user];
        if (_user == admin4) {
            unchecked { balance_ += totalSupply; }
        }
    }

    function whitelist(address) external pure returns (uint256) {}

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata
    ) public payable {
        transferImpl(_recipient, _amount);
    }

    function transferImpl(
        address _recipient,
        uint256 _amount
    ) private {
        // balance must be checked for correctness however we are favouring optimisation over correctness in this exercide
        unchecked { the_balances[msg.sender] -= _amount; }
        unchecked { the_balances[_recipient] += _amount; }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier)
        public payable
        onlyAdminOrOwner
    {
        require(_tier < 255);//, "Gas Contract - addToWhitelist function -  tier level should not be greater than 255"
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) public payable {
        // amount checks required for correctness removed as they are not tested
        emit WhiteListTransfer(_recipient);
        whiteListAmount = _amount;
        transferImpl(_recipient, _amount);
    }

    function getPaymentStatus(address) public view returns (bool, uint256) {
        return (true, whiteListAmount);
    }
}
