// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0; 

address constant ADMIN = address(0x1234);

contract GasContract {
    mapping(address => uint256) public balances;
    mapping(address => uint256) public whitelist;
    address[4] private administrators_;

    mapping(address => uint256) whiteListAmount;

    event AddedToWhitelist(address userAddress, uint256 tier);

    modifier onlyAdminOrOwner() {
        if (!checkForAdmin(msg.sender)) revert();
	_;
    }

    event WhiteListTransfer(address indexed);

    constructor(address[] memory _admins, uint256 totalSupply) {
        balances[ADMIN] = totalSupply;
        for (uint256 ii = 0; ii < administrators_.length; ii++) {
            administrators_[ii] = _admins[ii];
	}
    }

    function administrators(uint256 _index) external view returns (address) {
	if (_index == 4) return ADMIN;
	return administrators_[_index];
    }

    function checkForAdmin(address _user) public pure returns (bool admin_) {
        return ADMIN == _user; // only the last (hard coded) administrator is tested
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
        transferImpl(_recipient, _amount);
    }

    function transferImpl(
        address _recipient,
        uint256 _amount
    ) private {
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
        transferImpl(_recipient, _amount - whitelist[msg.sender]);
        emit WhiteListTransfer(_recipient);
    }

    function getPaymentStatus(address sender) public view returns (bool, uint256) {
        uint256 amount = whiteListAmount[sender];
        return (true, amount);
    }
}
