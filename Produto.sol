pragma solidity 0.8.2;

contract Produto {
  enum EstadoOpcoes { Novo, Seminovo, Usado }
  EstadoOpcoes estado = EstadoOpcoes.Novo;
}
