import { ADD, ADD_POKEMONS, CAPTURE, RELEASE } from './actionTypes';

function capturePokemon(state, pokemon) {
  return {
    pokemons: state.pokemons.filter((p) => p.name !== pokemon.name),
    capturedPokemons: [...state.capturedPokemons, pokemon],
  };
}
function releasePokemon(state, pokemon) {
  return {
    pokemons: [...state.pokemons, pokemon],
    capturedPokemons: state.capturedPokemons.filter((p) => p.name !== pokemon.name),
  };
}
function addPokemon(state, pokemon) {
  const allPokemons = [...state.pokemons,...state.capturedPokemons]
  const foundedPokemon = allPokemons.find((p) => p.name === pokemon.name);
  if (foundedPokemon) {
    return state;
  }
  
  return {
    capturedPokemons: state.capturedPokemons,
    pokemons: [...state.pokemons, pokemon],
  };
}
function addPokemons(state, pokemons) {
  return {
    ...state,
    pokemons,
  };
}

export const pokemonReducer = (state, action) => {
  switch (action.type) {
    case CAPTURE:
      return capturePokemon(state, action.payload);
    case RELEASE:
      return releasePokemon(state, action.payload);
    case ADD:
      return addPokemon(state, action.payload);
    case ADD_POKEMONS:
      return addPokemons(state, action.payload);
    default:
      return state;
  }
};
