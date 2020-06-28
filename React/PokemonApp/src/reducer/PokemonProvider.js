import React, { createContext, useReducer } from 'react';
import { ADD, ADD_POKEMONS, CAPTURE, RELEASE } from './actionTypes';
import { pokemonReducer } from './reducer';

export const PokemonContext = createContext();
const initialState = {
  pokemons: [],
  capturedPokemons: [],
};
export function PokemonProvider({ children }) {
  const [state, dispatch] = useReducer(pokemonReducer, initialState);

  const capture = (payload) => () => {
    dispatch({
      type: CAPTURE,
      payload,
    });
  };
  const release = (payload) => () => {
    dispatch({
      type: RELEASE,
      payload,
    });
  };
  const add = (payload) => {
    dispatch({
      type: ADD,
      payload,
    });
  };

  //When we use reference types as dependency array with useEffect hook, we have to use useCallback or useMemo
  //If we don't every time new reference is created and re-renders occurs.
  //https://kentcdodds.com/blog/usememo-and-usecallback
  const addPokemons = React.useCallback((payload) => {
    dispatch({
      type: ADD_POKEMONS,
      payload,
    });
  },[])
  const { pokemons, capturedPokemons } = state;

  const providerValue = {
    release,
    capture,
    add,
    addPokemons,
    pokemons,
    capturedPokemons,
  };

  return (
    <PokemonContext.Provider value={providerValue}>
      {children}
    </PokemonContext.Provider>
  );
}
