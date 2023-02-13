let { adder, concatenate } = require('../src/index.ts');

describe('adder module', () => {
    test('test_adder', ()=> {
        expect(adder(1,2)).toBe(3)
    });
});

describe('concatenate module', () => {
    test('test_concatenate', ()=> {
        expect(concatenate('mary',' had a little lamb')).toBe('mary had a little lamb')
    });
});