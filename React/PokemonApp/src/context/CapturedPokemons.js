import React, { useContext } from 'react';
import { PokemonContext } from './PokemonProvider';

export const CapturedPokemons = () => {
  const {
    pokemonList,
    setPokemonList,
    capturedPokemons,
    setCapturedPokemons,
  } = useContext(PokemonContext);

  const removeFromCapturedPokemon = (pokemon) => {
    return capturedPokemons.filter((p) => p.id !== pokemon.id);
  };
  const releasePokemon = (pokemon) => () => {
    setPokemonList([...pokemonList, pokemon]);
    setCapturedPokemons(removeFromCapturedPokemon(pokemon));
  };

  return (
    <React.StrictMode>
      <h2>Captured Pokemons</h2>
      <div>
        {capturedPokemons.map((pokemon) => (
          <p key={pokemon.id - pokemon.name}>
            {pokemon.id} - {pokemon.name}
            <button onClick={releasePokemon(pokemon)}>-</button>
          </p>
        ))}
      </div>
    </React.StrictMode>
  );
};
