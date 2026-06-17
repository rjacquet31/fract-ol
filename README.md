# fract-ol

> **42 cursus** · C · MiniLibX · an interactive fractal explorer.

A graphical program that renders fractals (Mandelbrot, Julia and more) with zoom and navigation, drawn pixel by pixel using the MiniLibX library.

## Features

- Mandelbrot and Julia sets (Julia parameters passed as arguments)
- Mouse-wheel zoom centred on the cursor and keyboard navigation
- Colour shifting and clean exit handling

## Build

```bash
make        # builds fractol (requires MiniLibX)
```

## Usage

```bash
./fractol mandelbrot
./fractol julia -0.7 0.27015
```

## Key concepts

Complex numbers, graphics programming, event handling and pixel buffers.

---

*42 cursus project — [github.com/rjacquet31](https://github.com/rjacquet31)*
