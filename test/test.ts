var a = (): string => 123
var p: Promise<void>

var a = { template: /*eee*/ this.template
}

type A = [
    /*test*/ string,
    /*test*/ string,
]

function tail<T extends any[]>(arr: readonly [any, ...T]) {
    const [_ignored, ...rest] = arr;
    return rest;
}

let resp = await someAPI()
resp &&= resp.data

type Range = [start: number, end: number, rest?: () => 123];

var b: unique symbol = 123

var c: readonly t.MyClass<T>[] = 333

c?.test

const COMPILER_PROVIDERS: Array<any[]> = null

var a = {
  get method<T>(a) {
  },
}

var a = [/\/\//, 123]

if (/*rete*/123) {}


if (a < (<number>b))
    a
}
while (
 // sdkfsld
  ss) {
}

var a: T[K] = 1213

switch (eww) {
  case 1222
}

var a = 123

class MyClass<string> extends Mixin({test: 123}) {
    noed // ewewe
    a = '3' // ewew
    get(arg: string) {
    }
}

var a = test[333]

function test({a = process.stdout}) {}

// test
var a = 1/3
/* test*/
type A = 42


test({
  async a: test ? // test
  test: ee
})

getSymbolIterator(3) in obj;

const a = (): string => '123'


list.reduce((flat: any[], item: T | T[]): T[] => {
  const flatItem = Array.isArray(item) ? flatten(item) : item;
  return (<T[]>flat).concat(flatItem);
}, []);

export function noProviderError(injector: ReflectiveInjector, key: ReflectiveKey): InjectionError {
  return injectionError(injector, key, function(keys: ReflectiveKey[]) {
    const first = stringify(keys[0].token);
    return `No provider for ${first}!${constructResolvingPath(keys)}`;
  });
}


export class QueryList<T>/* implements Iterable<T> */ {
  public readonly dirty = true;
}


class A {
    a = (a: () => void) => { }
}

var a = ({a: () => 123})

enum A {

}

interface FooBar<T extends Record<string, any> = Record<string, any>> {
  foo: string;
  bar: number;
}

[].map(({num}, index) => {
    const key = `${num}`
})

const [foo, [bar, baz = 1], ...rest] = arr;
const [
  foo = 'alice',
  ...rest,
] = arr;

const {foo, bar: {baz = 1, qux: quux, 'foo bar': foobar}, ...rest} = obj;
const {
  foo = 'alice',
  bar: {
    qux: quux,
    'foo bar': foobar,
  },
  ...rest,
} = obj;

const {foo: [a, {b, 'bar': d}, ...x], ...y} = obj;

type Greeting = `hello ${World}`;
type X = Y extends string ? string : Y