pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/5_rupee.sol";
import "../src/Buy_erupee.sol";
import "../src/rupees_ERC20.sol";

contract CBDC_test is Test, _1Rupee(msg.sender), buy_ERupee {
    _1Rupee public _1Rupee_CBDC;
    _2Rupee public _2Rupee_CBDC;
    _5Rupee public _5Rupee_CBDC;
    _10Rupee public _10Rupee_CBDC;
    _20Rupee public _20Rupee_CBDC;
    _50Rupee public _50Rupee_CBDC;
    _100Rupee public _100Rupee_CBDC;
    _200Rupee public _200Rupee_CBDC;
    _500Rupee public _500Rupee_CBDC;
    buy_ERupee public erupee;
    GLDToken public RupeeToken;

    function setUp() public {
        vm.startPrank(msg.sender);
        _1Rupee_CBDC = new _1Rupee(msg.sender);
        _2Rupee_CBDC = new _2Rupee(msg.sender);
        _5Rupee_CBDC = new _5Rupee(msg.sender);
        _10Rupee_CBDC = new _10Rupee(msg.sender);
        _20Rupee_CBDC = new _20Rupee(msg.sender);
        _50Rupee_CBDC = new _50Rupee(msg.sender);
        _100Rupee_CBDC = new _100Rupee(msg.sender);
        _200Rupee_CBDC = new _200Rupee(msg.sender);
        _500Rupee_CBDC = new _500Rupee(msg.sender);

        erupee = new buy_ERupee();
        RupeeToken = new GLDToken(100000000000000000000000);
        RupeeToken.approve(address(erupee), 1000000000000000000000000);

        RupeeToken.mint(100000000000000000000000000000);

        // _1Rupee_CBDC.safeMint(msg.sender);
        // _1Rupee_CBDC.safeMint(msg.sender);

        // address CBDC_ADDR = address(_1Rupee_CBDC);
        // console.log(CBDC_ADDR);
    }

    function testContract() external {
        address CBDC_ADDR = address(_1Rupee_CBDC);
        address addr = CBDC_ADDR;
        address ERC20RupeeAddr = address(RupeeToken);
        console.log(CBDC_ADDR);
        console.log(
            "balance of your account is",
            _1Rupee_CBDC.balanceOf(msg.sender)
        );
        erupee.setContracts(
            address(_1Rupee_CBDC),
            address(_2Rupee_CBDC),
            address(_5Rupee_CBDC),
            address(_10Rupee_CBDC),
            address(_20Rupee_CBDC),
            address(_50Rupee_CBDC),
            address(_100Rupee_CBDC),
            address(_200Rupee_CBDC),
            address(_500Rupee_CBDC),
            ERC20RupeeAddr
        );
        console.log(RupeeToken.balanceOf(msg.sender));
        console.log("controller is", _1Rupee_CBDC.return_controller());
        erupee.changeOwner(msg.sender);
        erupee.buy_With_note_denominations(999000000000000000000);
        erupee.transferAmount(
            999000000000000000000,
            0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
        );

        // console.log()
    }

    function testMint() external {
        vm.startPrank(address(erupee));
        console.log("balance is", RupeeToken.balanceOf(msg.sender));
        //  erupee.buy_With_note_denominations(1000000000000000000);
    }
}
