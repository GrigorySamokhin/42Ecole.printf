# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gmeizo <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/05 15:29:36 by gmeizo            #+#    #+#              #
#    Updated: 2019/06/05 15:29:37 by gmeizo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gmeizo <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/06/05 15:29:36 by gmeizo            #+#    #+#              #
#    Updated: 2019/06/05 15:29:37 by gmeizo           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

FLAGS = -Wall -Wextra -Werror

LIBFT = includes/libft

DIR_S = source

DIR_O = objects

HEADER = includes/libftprintf.h

SOURCES = ft_printf.c \
          printf_add.c \
          printf_di.c \
          printf_f.c \
          printf_ftwo.c \
          printf_ou.c \
          printf_s.c \
          printf_set.c \
          printf_set_v.c \
          printf_xchp.c \

SRCS = $(addprefix $(DIR_S)/,$(SOURCES))

OBJS = $(addprefix $(DIR_O)/,$(SOURCES:.c=.o))

all: $(NAME)

$(NAME): $(OBJS)
	make -C $(LIBFT)
	cp includes/libft/libft.a ./$(NAME)
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)

$(DIR_O)/%.o: $(DIR_S)/%.c
	mkdir -p objects
	$(CC) $(FLAGS) -I $(HEADER) -o $@ -c $<

clean:
	rm -f $(OBJS)
	rm -rf $(DIR_O)
	make clean -C $(LIBFT)

fclean: clean
	rm -f $(NAME)
	make fclean -C $(LIBFT)

re: fclean all