/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rafael <rafael@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/01/14 15:12:33 by rafael            #+#    #+#             */
/*   Updated: 2025/01/14 15:12:33 by rafael           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../include/fractol.h"

void	init_fractal(t_fractal *fractal)
{
	if (fractal)
	{
		fractal->color = 0xFCBE11;
		fractal->zoom = 300.0;
		fractal->offset_x = -1.21;
		fractal->offset_y = -1.21;
		fractal->max_iterations = 42;
		fractal->cx = 0.0;
		fractal->cy = 0.0;
	}
}

void	init_mlx(t_fractal *fractal)
{
	if (fractal)
	{
		fractal->mlx = mlx_init();
		if (!fractal->mlx)
			exit(EXIT_FAILURE);
		fractal->window = mlx_new_window(fractal->mlx, SIZE, SIZE, "Fract-ol");
		if (!fractal->window)
			exit(EXIT_FAILURE);
		fractal->image = mlx_new_image(fractal->mlx, SIZE, SIZE);
		if (!fractal->image)
			exit(EXIT_FAILURE);
		fractal->pointer_to_image = mlx_get_data_addr(
				fractal->image,
				&fractal->bits_per_pixel,
				&fractal->size_line,
				&fractal->endian
				);
	}
}
