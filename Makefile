# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gboutin <gboutin@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/08/27 13:51:02 by gboutin           #+#    #+#              #
#    Updated: 2019/08/27 14:12:58 by gboutin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.SILENT:
CC = gcc
NAME = ft_printf
CFLAGS = -Wall -Wextra -Werror
LIBFT = cd libft && make
LIBFTFILES = libft/libft.a
OBJDIR = ./obj/
SRCDIR = ./srcs/
HDRDIR = ./includes/
RED =		\033[1;31m
CYAN =		\033[1;36m
GREEN =		\033[1;32m
NO_COLOR =	\033[0m
SRCS =	main.c

SRCFILES = $(addprefix $(SRCDIR), $(SRCS))
OBJFILES = $(addprefix $(OBJDIR), $(OBJ))
OBJ = $(SRCS:.c=.o)

all: $(NAME)
	make -C libft all

$(OBJDIR)%.o: $(SRCDIR)%.c $(HDRDIR)$(NAME).h Makefile
	mkdir -p obj/
	$(CC) $(CFLAGS) -o $@ -c $< -I $(HDRDIR)
	echo "$(CYAN)Compiling:\t\t$(GREEN)$<$(NO_COLOR)"

$(NAME): $(OBJFILES)
	$(LIBFT)
	$(CC) -o $@ $(CFLAGS) $^ $(LIBFTFILES)
	echo "$(CYAN)Executable:\t\t$(GREEN)[Done]$(NO_COLOR)"

clean:
	$(RM) -rf $(OBJFILES)
	cd libft && make fclean

fclean: clean
	$(RM) -rf $(NAME)
	echo "$(RED)Deleted:\t\t$(NAME)$(NO_COLOR)"

re: fclean all

.PHONY: all clean fclean re