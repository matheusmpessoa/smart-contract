pragma solidity 0.8.2;

contract Bolao {
    address private gerente;
    address[] private jogadores;
    address payable private vencedor;

    constructor() public {
        gerente = msg.sender;
    }

    function entrar() public payable {
        require(msg.value == .1 ether);
        jogadores.push(msg.sender);
    }

    function descobrirGanhador() public restricted {
        uint index = randomico() % jogadores.length;
        vencedor = address(uint160(jogadores[index]));
        vencedor.transfer(address(this).balance);
        jogadores = new address[](0);
        vencedor = address(uint160(0x0)); 
    }

    modifier restricted() {
        require(msg.sender == gerente);
        _;
    }
    
    function getSaldo() public view returns (uint) {
        return uint(address(this).balance);
    }

    function randomico() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.difficulty, now, jogadores)));
    }
}
