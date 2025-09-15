# 📘 JavaScript Array Methods Cheat Sheet

Una guía rápida de métodos útiles para arreglos en JavaScript.

---

## 🔍 Información del arreglo

```js
[1, 2, 3].length           // 3
[1, 2, 3].includes(2)      // true
[1, 2, 3].indexOf(2)       // 1
[1, 2, 3].lastIndexOf(2)   // 1
[1, 2, 3].join('-')        // '1-2-3'
```

---

## 🔁 Transformación

```js
[1, 2, 3].map(x => x * 2)             // [2, 4, 6]
[1, 2, 3].filter(x => x % 2 === 0)    // [2]
[1, 2, 3].reduce((a, b) => a + b, 0)  // 6
[1, 2, 3].flatMap(x => [x, x * 2])    // [1, 2, 2, 4, 3, 6]
```

---

## 🔧 Modificación

```js
[1, 2, 3].push(4)         // [1, 2, 3, 4]
[1, 2, 3].pop()           // [1, 2]
[1, 2, 3].shift()         // [2, 3]
[1, 2, 3].unshift(0)      // [0, 1, 2, 3]
[1, 2, 3].splice(1, 1)    // [1, 3]
```

---

## 🧪 Búsqueda y condición

```js
[1, 2, 3].find(x => x > 1)       // 2
[1, 2, 3].findIndex(x => x > 1)  // 1
[1, 2, 3].some(x => x > 2)       // true
[1, 2, 3].every(x => x > 0)      // true
```

---

## 📋 Copia y corte

```js
[1, 2, 3].slice(1)         // [2, 3]
[1, 2, 3].concat([4, 5])   // [1, 2, 3, 4, 5]
[1, 2, 3].copyWithin(0, 1) // [2, 3, 3]
```

---

## 🧹 Orden y reversa

```js
[3, 1, 2].sort()          // [1, 2, 3]
[1, 2, 3].reverse()       // [3, 2, 1]
```

---

## 🧠 Otros útiles

```js
Array.from('123')         // ['1', '2', '3']
Array.isArray([1, 2, 3])  // true
```

---

## 📎 Tip

Todos los métodos que **no modifican el arreglo original** son **inmutables**, lo cual es ideal para programación funcional.

---

> 🧠 Guárdalo como referencia rápida o agrégalo a tu repositorio de conocimiento personal.
