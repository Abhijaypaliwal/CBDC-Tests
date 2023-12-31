pragma solidity ^0.8.9;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/utils/Counters.sol";

contract _1Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    address public controllerAddr;
    mapping(address => uint256[]) public HolderMapping;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("1 Rupees", "Rs. 1") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    function arrayMappingpop() public {
        HolderMapping[msg.sender].pop();
    }

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
    function return_controller() public view returns(address) {
        return controllerAddr;
    }
}

contract _2Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    mapping(address => uint256[]) public HolderMapping;

    address public controllerAddr;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("2 Rupees", "Rs. 2") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _5Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(address => uint256[]) public HolderMapping;
    address public controllerAddr;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("5 Rupees", "Rs. 5") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _10Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;

    }
    address controllerAddr;

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("10 Rupees", "Rs. 10") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    mapping(address => uint256[]) public HolderMapping;

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _20Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(address => uint256[]) public HolderMapping;
    address controllerAddr;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("20 Rupees", "Rs. 20") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _50Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(address => uint256[]) public HolderMapping;
    address public controllerAddr;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("50 Rupees", "Rs. 50") {
        controllerAddr = _controller;

    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _100Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }
    address controllerAddr;

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("100 Rupees", "Rs. 100") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    mapping(address => uint256[]) public HolderMapping;

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _200Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }
    address controllerAddr;

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("200 Rupees", "Rs. 200") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    mapping(address => uint256[]) public HolderMapping;

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}

contract _500Rupee is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    modifier onlyOwnerContract() {
        require(msg.sender == controllerAddr, "not called by owner");
        _;
    }
    address controllerAddr;

    function changeController(address _addr) public {
        controllerAddr = _addr;
    }

    constructor(address _controller) ERC721("500 Rupees", "Rs. 500") {
        controllerAddr = _controller;
    }

    function safeMint(address to) public  {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        HolderMapping[to].push(tokenId);
    }

    mapping(address => uint256[]) public HolderMapping;

    function transfer_rupee(address _from, address _to) public {
        uint256 x = HolderMapping[_from][HolderMapping[_from].length - 1];
        _transfer(_from, _to, x);
        HolderMapping[_from].pop();
        HolderMapping[_to].push(x);
    }

    function return_num_notes(address _user) public view returns (uint256) {
        return HolderMapping[_user].length;
    }

    function burn_nft(address _address) internal {
        uint256 x = HolderMapping[_address][HolderMapping[_address].length - 1];
        _burn(x);
        HolderMapping[_address].pop();
    }
}
