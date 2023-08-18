// SPDX-License-Identifier: MIT


                                                                      
//     ,o888888o.    8 888888888o   8 888888888o.          ,o888888o.    
//    8888     `88.  8 8888    `88. 8 8888    `^888.      8888     `88.  
// ,8 8888       `8. 8 8888     `88 8 8888        `88. ,8 8888       `8. 
// 88 8888           8 8888     ,88 8 8888         `88 88 8888           
// 88 8888           8 8888.   ,88' 8 8888          88 88 8888           
// 88 8888           8 8888888888   8 8888          88 88 8888           
// 88 8888           8 8888    `88. 8 8888         ,88 88 8888           
// `8 8888       .8' 8 8888      88 8 8888        ,88' `8 8888       .8' 
//    8888     ,88'  8 8888    ,88' 8 8888    ,o88P'      8888     ,88'  
//     `8888888P'    8 888888888P   8 888888888P'          `8888888P'    


// ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┬    ╔╗ ┌─┐┌┐┌┬┌─  ╔╦╗┬┌─┐┬┌┬┐┌─┐┬    ╔═╗┬ ┬┬─┐┬─┐┌─┐┌┐┌┌─┐┬ ┬
// ║  ├┤ │││ │ ├┬┘├─┤│    ╠╩╗├─┤│││├┴┐   ║║││ ┬│ │ ├─┤│    ║  │ │├┬┘├┬┘├┤ ││││  └┬┘
// ╚═╝└─┘┘└┘ ┴ ┴└─┴ ┴┴─┘  ╚═╝┴ ┴┘└┘┴ ┴  ═╩╝┴└─┘┴ ┴ ┴ ┴┴─┘  ╚═╝└─┘┴└─┴└─└─┘┘└┘└─┘ ┴ 

/**
 * @title Central Bank Digital Currency (CBDC) Smart Contract
 * @notice This smart contract facilitates the issuance, exchange, and management
 *         of digital tokens representing various rupee denominations on the blockchain.
 * @dev The contract provides functionalities for minting, transferring, and managing
 *      digital tokens equivalent to physical currency denominations.
 * @dev This contract is designed to enable the creation of a Central Bank Digital Currency (CBDC)
 *      ecosystem, allowing for seamless interaction between traditional physical currency and blockchain technology.
 * @dev The CBDC smart contract operates as a bridge, facilitating the conversion of physical currency into digital tokens,
 *      and enabling secure and efficient digital transactions.
 */
 
pragma solidity ^0.8.16;

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

interface IMyToken {z
    function safeMint(address to) external;

    function transfer_rupee(address _from, address _to) external;

    function return_num_notes(address _user) external returns (uint256);

    function burn_nft(address _address) external;
}

contract buy_ERupee {
    address public _owner;
    address public one_Rupee_contract;
    address public two_Rupee_contract;
    address public five_Rupee_contract;
    address public ten_Rupee_contract;
    address public twenty_Rupee_contract;
    address public fifty_Rupee_contract;
    address public one_hundred_Rupee_contract;
    address public two_hundred_Rupee_contract;
    address public five_hundred_Rupee_contract;
    address public rupee_contract_ERC20;
    address[9] public _rupeeContractList;
    uint256 public _5RupeeCount = 0;
    uint256 public _10RupeeCount;
    uint256 public _20RupeeCount;
    uint256 public _num; * @title Central Bank Digital Currency (CBDC) Smart Contract
 * @notice This smart contract facilitates the issuance, exchange, and management
 *         of digital tokens representing various rupee denominations on the blockchain.
 * @dev The contract provides functionalities for minting, transferring, and managing
 *      digital tokens equivalent to physical currency denominations.
 * @dev This contract is designed to enable the creation of a Central Bank Digital Currency (CBDC)
 *      ecosystem, allowing for seamless interaction between traditional physical currency and blockchain technology.
 * @dev The CBDC smart contract operates as a bridge, facilitating the conversion of physical currency into digital tokens,
 *      and enabling secure and efficient digital transactions.
    mapping(address => uint256) public userFundsMapping;
    mapping(address => bool) public isBlackListedMapping;
    uint256[] denominationArr = [500, 200, 100, 50, 20, 10, 5, 2, 1];

    constructor() {
        _owner = msg.sender;
    }

    modifier OnlyOwner() {
        require(_owner == msg.sender, "can only be called by owner");
        _;
    }

    modifier blackListedCheck(address _to) {
        require(
            isBlackListedMapping[_to] == false,
            "reciever's address is blacklisted"
        );
        _;
    }

    /**
     * @notice Changes the owner of the contract.
     * @param _newOwner Address of the new owner.
     */

    function changeOwner(address _newOwner) public {
        _owner = _newOwner;
    }

    /**
     * @notice Sets the addresses of various rupee denomination contracts.
     * @param _1Rupee Address of the 1 Rupee contract.
     * @param _2Rupee Address of the 2 Rupee contract.
     * @param _5Rupee Address of the 5 Rupee contract.
     * @param _10Rupee Address of the 10 Rupee contract.
     * @param _20Rupee Address of the 20 Rupee contract.
     * @param _50Rupee Address of the 50 Rupee contract.
     * @param _100Rupee Address of the 100 Rupee contract.
     * @param _200Rupee Address of the 200 Rupee contract.
     * @param _500Rupee Address of the 500 Rupee contract.
     * @param _rupeeContract_ERC20 Address of the Rupee ERC20 contract.
     * @return Returns true after successfully setting the contracts.
     */

    function setContracts(
        address _1Rupee,
        address _2Rupee,
        address _5Rupee,
        address _10Rupee,
        address _20Rupee,
        address _50Rupee,
        address _100Rupee,
        address _200Rupee,
        address _500Rupee,
        address _rupeeContract_ERC20
    ) external OnlyOwner returns (bool) {
        rupee_contract_ERC20 = _rupeeContract_ERC20;
        _rupeeContractList = [
            _500Rupee,
            _200Rupee,
            _100Rupee,
            _50Rupee,
            _20Rupee,
            _10Rupee,
            _5Rupee,
            _2Rupee,
            _1Rupee
        ];
        return true;
    }

    /**
     * @notice Retrieves the user's fund amount.
     * @param _user Address of the user.
     * @return Returns the user's fund amount.
     */

    function getUserFundAmt(address _user) public view returns (uint) {
        return userFundsMapping[_user];
    }

    /**
     * @notice Adds an address to the blacklist.
     * @param _blackListAddr Address to be blacklisted.
     */

    function blackList(address _blackListAddr) public OnlyOwner {
        isBlackListedMapping[_blackListAddr] = true;
    }

    function noteCalculation(
        uint256 _num1,
        uint256 _division
    ) public returns (uint256, uint256) {
        uint256 _RupeeNum = _num1 / _division;
        _num = _num1 % _division;
        return (_RupeeNum, _num);
    }

    /**
     * @notice Buys eRupee using notes of various denominations.
     * @param _amount Amount of eRupee to be purchased in wei.
     */

    function buy_With_note_denominations(uint256 _amount) external {
        uint256[9] memory userNoteCount;
        IERC20 _rupeeContract = IERC20(rupee_contract_ERC20);
        _rupeeContract.transferFrom(msg.sender, address(this), _amount);
        uint256 _num1 = _amount / (10 ** 18);

        for (uint256 k = 0; k < 9; k++) {
            uint256 temp = 0;
            (temp, _num1) = (noteCalculation(_num1, denominationArr[k]));
            userNoteCount[k] = temp;
        }

        uint256 i = 0;
        for (i = 0; i < 9; i++) {
            for (uint256 j = 0; j < userNoteCount[i]; j++) {
                IMyToken __Rupee_contract = IMyToken(_rupeeContractList[i]);
                __Rupee_contract.safeMint(msg.sender);
            }
        }
        userFundsMapping[msg.sender] += _amount;
    }

    function fetchUserNotes(
        address _user
    ) internal returns (uint256[9] memory) {
        uint256[9] memory _availArr;
        for (uint256 i = 0; i < 9; i++) {
            IMyToken __Rupee_contract = IMyToken(_rupeeContractList[i]);
            _availArr[i] = __Rupee_contract.return_num_notes(_user);
        }
        return _availArr;
    }

    /**
     * @notice Transfers eRupee amount to another address using note denominations.
     * @param _amount Amount of eRupee to be transferred in wei.
     * @param _to Address of the recipient.
     */

    function transferAmount(
        uint256 _amount,
        address _to
    ) public blackListedCheck(_to) {
        require(
            userFundsMapping[msg.sender] >= _amount,
            "funds are less than requested"
        );
        uint256[9] memory NoteAvailArr = fetchUserNotes(msg.sender); // current note count
        uint256[9] memory NoteNeededCount; // exact amt needed for transaction
        uint256[9] memory transferArr; // transfer to user at last
        userFundsMapping[msg.sender] -= _amount;
        userFundsMapping[_to] += _amount;
        uint256 _num1 = _amount / (10 ** 18);
        uint256 rem_mint = 0;
        uint256 rem_change = 0;
        uint256 denom_burn;

        for (uint256 k = 0; k < 9; k++) {
            uint256 temp = 0;
            (temp, _num1) = (noteCalculation(_num1, denominationArr[k]));
            NoteNeededCount[k] = (temp);
        }
        uint256 total = 0;

        for (uint256 i = 0; i < 9; i++) {
            if (NoteAvailArr[i] >= NoteNeededCount[i]) {
                total += denominationArr[i] * NoteNeededCount[i];
                transferArr[i] = NoteNeededCount[i];
                NoteAvailArr[i] -= NoteNeededCount[i];
            } else {
                uint256 change = _amount / (10 ** 18) - total;
                for (uint256 j = i - 1; j >= 0; j--) {
                    if (change < denominationArr[j] && NoteAvailArr[j] > 0) {
                        rem_mint = denominationArr[j] - change;
                        rem_change = denominationArr[j] - rem_mint;
                        denom_burn = denominationArr[j];
                        IMyToken __Rupee_contract = IMyToken(
                            _rupeeContractList[j]
                        );
                        __Rupee_contract.transfer_rupee(msg.sender, address(0));
                        break;
                    }
                }
                break;
            }
        }

        sendNFT(transferArr, _to, rem_mint, rem_change);
    }

    function sendNFT(
        uint256[9] memory _transferArr,
        address _to,
        uint256 _rem_mint,
        uint256 _rem_change
    ) internal {
        for (uint256 i = 0; i < 9; i++) {
            for (uint256 j = 0; j < _transferArr[i]; j++) {
                IMyToken __Rupee_contract = IMyToken(_rupeeContractList[i]);
                __Rupee_contract.transfer_rupee(msg.sender, _to);
            }
        }

        uint256 _num1 = _rem_mint;
        uint256 _num2 = _rem_change;
        uint256[9] memory NoteNeeded_rem_mint;
        uint256[9] memory NoteNeeded_rem_change;

        for (uint256 k = 0; k < 9; k++) {
            uint256 temp = 0;
            (temp, _num1) = (noteCalculation(_num1, denominationArr[k]));
            NoteNeeded_rem_mint[k] = temp;
        }

        for (uint256 i = 0; i < 9; i++) {
            for (uint256 j = 0; j < NoteNeeded_rem_mint[i]; j++) {
                IMyToken __Rupee_contract = IMyToken(_rupeeContractList[i]);
                __Rupee_contract.safeMint(msg.sender);
            }
        }

        for (uint256 k = 0; k < 9; k++) {
            uint256 temp = 0;
            (temp, _num2) = (noteCalculation(_num2, denominationArr[k]));
            NoteNeeded_rem_change[k] = temp;
        }

        for (uint256 i = 0; i < 9; i++) {
            for (uint256 j = 0; j < NoteNeeded_rem_change[i]; j++) {
                IMyToken __Rupee_contract = IMyToken(_rupeeContractList[i]);
                __Rupee_contract.safeMint(_to);
            }
        }
    }
}
