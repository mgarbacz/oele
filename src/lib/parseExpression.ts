export default function parseExpression(expression: string) {
  return [
    [
      {
        type: 'variable',
        value: 'user.status',
        text: 'user.status',
        offset: 0,
        lineBreaks: 0,
        line: 1,
        col: 1
      },
      {
        type: 'ws',
        value: ' ',
        text: ' ',
        offset: 11,
        lineBreaks: 0,
        line: 1,
        col: 12
      },
      {
        type: 'comparison',
        value: '==',
        text: '==',
        offset: 12,
        lineBreaks: 0,
        line: 1,
        col: 13
      },
      {
        type: 'ws',
        value: ' ',
        text: ' ',
        offset: 14,
        lineBreaks: 0,
        line: 1,
        col: 15
      },
      {
        type: 'value',
        value: '"active"',
        text: '"active"',
        offset: 15,
        lineBreaks: 0,
        line: 1,
        col: 16
      }
    ],
    [
      {
        type: 'expression',
        value: 'AND',
        text: 'AND',
        offset: 24,
        lineBreaks: 0,
        line: 1,
        col: 25
      }
    ],
    [
      {
        type: 'variable',
        value: 'user.getGroups.size',
        text: 'user.getGroups.size',
        offset: 28,
        lineBreaks: 0,
        line: 1,
        col: 29
      },
      {
        type: 'ws',
        value: ' ',
        text: ' ',
        offset: 47,
        lineBreaks: 0,
        line: 1,
        col: 48
      },
      {
        type: 'comparison',
        value: '>',
        text: '>',
        offset: 48,
        lineBreaks: 0,
        line: 1,
        col: 49
      },
      {
        type: 'ws',
        value: ' ',
        text: ' ',
        offset: 49,
        lineBreaks: 0,
        line: 1,
        col: 50
      },
      {
        type: 'value',
        value: '0',
        text: '0',
        offset: 50,
        lineBreaks: 0,
        line: 1,
        col: 51
      }
    ]
  ];
}