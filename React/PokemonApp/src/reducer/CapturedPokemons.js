import React, { useContext } from 'react';
import { generatedId } from '../utils';
import { PokemonContext } from './PokemonProvider';

export const CapturedPokemons = () => {
  const { capturedPokemons, release } = useContext(PokemonContext);
  return (
    <React.StrictMode>
      <h2>Captured Pokemons</h2>
      <div>
        {capturedPokemons.map((pokemon) => (
          <p key={generatedId()}>
            {pokemon.name}
            <button onClick={release(pokemon)}>-</button>
          </p>
        ))}
      </div>
    </React.StrictMode>
  );
};
