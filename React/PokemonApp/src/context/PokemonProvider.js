import React, { createContext, useState } from 'react';

export const PokemonContext = createContext();

export function PokemonProvider({ children }) {
  const [pokemonList, setPokemonList] = useState([
    { id: 1, name: 'Bulbasaur' },
    { id: 2, name: 'Charmander' },
    { id: 3, name: 'Squirtle' },
  ]);

  const [capturedPokemons, setCapturedPokemons] = useState([]);

  const value = {
    pokemonList,
    setPokemonList,
    capturedPokemons,
    setCapturedPokemons,
  };

  return (
    <PokemonContext.Provider value={value}>{children}</PokemonContext.Provider>
  );
}
