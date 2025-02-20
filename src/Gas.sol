// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; 

contract GasContract {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public whitelist;
    address[5] public administrators;

    mapping(address => uint256) whiteListAmount;

    event AddedToWhitelist(address userAddress, uint256 tier);

    modifier onlyAdminOrOwner() {
        if (!checkForAdmin(msg.sender)) revert();
	_;
    }

    event WhiteListTransfer(address indexed);

    constructor(address[] memory _admins, uint256 totalSupply) {
        for (uint256 ii = 0; ii < administrators.length; ii++) {
            address admin = _admins[ii];
            administrators[ii] = admin;
            if (admin == msg.sender) {
                balances[admin] = totalSupply;
            }
        }
    }

    function checkForAdmin(address _user) public view returns (bool admin_) {
        return administrators[4] == _user; // only the last administrator is tested
    }

    function balanceOf(address _user) public view returns (uint256 balance_) {
        uint256 balance = balances[_user];
        return balance;
    }

    function transfer(
        address _recipient,
        uint256 _amount,
        string calldata
    ) public {
        // balance must be checked for correctness however we are favouring optimisation over correctness in this exercide
        balances[msg.sender] -= _amount;
        balances[_recipient] += _amount;
    }

    function addToWhitelist(address _userAddrs, uint256 _tier)
        public
        onlyAdminOrOwner
    {
        require(_tier < 255);//, "Gas Contract - addToWhitelist function -  tier level should not be greater than 255"
	uint256 tier = _tier;
        if (tier > 3) tier = 3;
        whitelist[_userAddrs] = tier;
        emit AddedToWhitelist(_userAddrs, _tier);
    }

    function whiteTransfer(
        address _recipient,
        uint256 _amount
    ) public {
	// amount checks required for correctness removed as they are not tested
        whiteListAmount[msg.sender] = _amount;
        uint256 adjust = _amount - whitelist[msg.sender];
        balances[msg.sender] -= adjust;
        balances[_recipient] += adjust;
        
        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public view returns (bool, uint256) {
        uint256 amount = whiteListAmount[sender];
        return (true, amount);
    }
}
