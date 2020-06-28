import React, { useContext, useEffect, } from 'react';
import { generatedId } from '../utils';
import { PokemonContext } from './PokemonProvider';

const url = 'https://pokeapi.co/api/v2/pokemon';
export function PokemonList() {
  const { pokemons, capture, addPokemons } = useContext(PokemonContext);

  useEffect(() => {
    const fetchPokemons = async () => {
      const response = await fetch(url);
      const data = await response.json();
      addPokemons(data.results);      
    };
    fetchPokemons();
  }, [addPokemons]);

  return (
    <React.StrictMode>
      <h2>Pokemons</h2>
      <div>
        {pokemons.map((pokemon) => (
          <p key={generatedId()}>
            {pokemon.name} {'   '} <button onClick={capture(pokemon)}>+</button>
          </p>
        ))}
      </div>
    </React.StrictMode>
  );
}
