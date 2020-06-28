import React from 'react';
import { CapturedPokemons } from './reducer/CapturedPokemons';
import { PokemonForm } from './reducer/PokemonForm';
import { PokemonList } from './reducer/PokemonList';
import { PokemonProvider } from './reducer/PokemonProvider';

export function App() {
  return (
    <PokemonProvider>
      <PokemonList />
      <CapturedPokemons />
      <PokemonForm />
    </PokemonProvider>
  );
}
