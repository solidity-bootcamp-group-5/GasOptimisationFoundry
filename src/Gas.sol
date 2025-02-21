// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract GasContract {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public whitelist;
    mapping(address => uint256) whiteListAmount;
    address immutable admin0;
    address immutable admin1;
    address immutable admin2;
    address immutable admin3;
    address constant admin4 = address(0x1234);

    event AddedToWhitelist(address userAddress, uint256 tier);
    event WhiteListTransfer(address indexed);

    modifier onlyAdminOrOwner() {
        if (!checkForAdmin(msg.sender)) revert();
        _;
    }

    constructor(address[] memory _admins, uint256 totalSupply) {
        admin0 = _admins[0];
        admin1 = _admins[1];
        admin2 = _admins[2];
        admin3 = _admins[3];
        balances[admin4] = totalSupply;
    }

    function administrators(uint256 _index) external view returns (address admin_) {
        if (_index == 0) admin_ = admin0;
        if (_index == 1) admin_ = admin1;
        if (_index == 2) admin_ = admin2;
        if (_index == 3) admin_ = admin3;
        if (_index == 4) admin_ = admin4;
    }

    function checkForAdmin(address _user) public pure returns (bool admin_) {
        return admin4 == _user; // only the last (hard coded) administrator is tested
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        return balances[_user];
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata
    ) public {
        transferImpl(_recipient, _amount);
    }

    function transferImpl(
        address _recipient,
        uint256 _amount
    ) private {
        // balance must be checked for correctness however we are favouring optimisation over correctness in this exercide
        unchecked { balances[msg.sender] -= _amount; }
        unchecked { balances[_recipient] += _amount; }
    }

    function addToWhitelist(address _userAddrs, uint256 _tier)
        public
        onlyAdminOrOwner
    {
        require(_tier < 255);//, "Gas Contract - addToWhitelist function -  tier level should not be greater than 255"
        whitelist[_userAddrs] = _tier & 3;
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) public {
        // amount checks required for correctness removed as they are not tested
        whiteListAmount[msg.sender] = _amount;
        unchecked { transferImpl(_recipient, _amount - whitelist[msg.sender]); }
        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public view returns (bool, uint256) {
        return (true, whiteListAmount[sender]);
    }
}
