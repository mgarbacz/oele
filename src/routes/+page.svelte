<script lang="ts">
  import parseExpression from '$lib/parseExpression';

  interface Predicate {
    name: string;
  }

  let predicates: Predicate[] = [];
  let expression: string = 'user.status == "active" AND user.getGroups.size > 0';
  let ast = parseExpression(expression);

  for (const section of ast) {
    if (section[0].type !== "expression") {
      let sectionText: string = "";
      for (const component of section) {
        sectionText += component.text;
      }
      predicates.push({ name: sectionText });
    }
  }

  function generateTruthTable(): Record<string, boolean>[] {
    const numPredicates = predicates.length;
    const numRows = Math.pow(2, numPredicates);

    let truthTable: Record<string, boolean>[] = [];

    for (let i = 0; i < numRows; i++) {
      let row: Record<string, boolean> = {};

      for (let j = 0; j < numPredicates; j++) {
        const predicate = predicates[j];
        row[predicate.name] = (i & (1 << j)) !== 0;
      }

      truthTable.push(row);
    }
    
    return truthTable;
  }
</script>

<main>
  <p>{expression}</p>
  <table>
    <thead>
      <tr>
        {#each predicates as predicate}
          <th>{predicate.name}</th>
        {/each}
      </tr>
    </thead>
    <tbody>
      {#each generateTruthTable() as row}
        <tr>
          {#each predicates as predicate}
            <td>{row[predicate.name] ? 'T' : 'F'}</td>
          {/each}
        </tr>
      {/each}
    </tbody>
  </table>
</main>

<style>
  :root {
    color: #fafafa;
    background-color: #333333;
    font-family: Arial, sans-serif;
  }
</style>
