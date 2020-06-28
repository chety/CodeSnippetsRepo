import React from 'react';
import { CapturedPokemons } from './context/CapturedPokemons';
import { PokemonList } from './context/PokemonList';
import { PokemonProvider } from './context/PokemonProvider';

export function App() {
  return (
    <PokemonProvider>
      <PokemonList />
      <CapturedPokemons />
    </PokemonProvider>
  );
}
