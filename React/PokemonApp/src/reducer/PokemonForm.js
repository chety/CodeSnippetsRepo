import React, { useContext, useState } from 'react';
import { generatedId } from '../utils';
import { PokemonContext } from './PokemonProvider';
export function PokemonForm() {
  const { add } = useContext(PokemonContext);

  const [pokemonName, setPokemonName] = useState(null);
  function onHandleChaneName(e) {
    setPokemonName(e.target.value);
  }
  function onSubmitForm(e) {
    e.preventDefault();
    add({
      id: generatedId(),
      name: pokemonName,
    });
  }

  return (
    <form onSubmit={onSubmitForm}>
      <input
        type='text'
        value={pokemonName}
        placeholder='pokemon name...'
        onChange={onHandleChaneName}
      />
      <input type='submit' value='Add' />
    </form>
  );
}

export default PokemonForm;
