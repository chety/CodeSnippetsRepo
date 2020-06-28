import React, { useContext } from 'react';
import { PokemonContext } from './PokemonProvider';
export function PokemonList() {
  const {
    pokemonList,
    setPokemonList,
    capturedPokemons,
    setCapturedPokemons,
  } = useContext(PokemonContext);

  const removeFromPokemonList = (pokemon) => {
    return pokemonList.filter((p) => p.id !== pokemon.id);
  };

  const capturePokemon = (pokemon) => () => {
    setCapturedPokemons([...capturedPokemons, pokemon]);
    setPokemonList(removeFromPokemonList(pokemon));
  };

  return (
    <React.StrictMode>
      <h2>Pokemons</h2>

      <div>
        {pokemonList.map((pokemon) => (
          <p key={pokemon.id + pokemon.name}>
            {pokemon.id} - {pokemon.name} {'   '}{' '}
            <button onClick={capturePokemon(pokemon)}>+</button>
          </p>
        ))}
      </div>
    </React.StrictMode>
  );
}
