/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putendl.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gboutin <gboutin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/11/09 16:35:46 by gboutin           #+#    #+#             */
/*   Updated: 2018/12/06 17:41:40 by gboutin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_putendl(char const *s)
{
	int		i;
	char	c;

	i = 0;
	c = '\n';
	if (!s)
		return ((void)0);
	while (s[i] != '\0')
	{
		write(1, &s[i], 1);
		i++;
	}
	write(1, &c, 1);
}
