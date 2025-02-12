# Couleurs pour afficher des messages
GREEN = \033[0;32m
RED = \033[0;31m
RESET = \033[0m

# Compiler et flags
CC = cc
CFLAGS = -Wall -Werror -Wextra -g -Wunused-result

# Répertoires
LIBFT_PATH = include/.libft
MLX_PATH = include/.minilibx
SRC_DIR = src
OBJ_DIR = obj
INCLUDE_DIR = include

# Fichiers source et objets
SRC_FILES = $(SRC_DIR)/draw.c $(SRC_DIR)/init.c $(SRC_DIR)/julia.c $(SRC_DIR)/main.c $(SRC_DIR)/mandelbrot.c $(SRC_DIR)/mouse.c $(SRC_DIR)/utils.c
OBJ_FILES = $(OBJ_DIR)/draw.o $(OBJ_DIR)/init.o $(OBJ_DIR)/julia.o $(OBJ_DIR)/main.o $(OBJ_DIR)/mandelbrot.o $(OBJ_DIR)/mouse.o $(OBJ_DIR)/utils.o

# Librairies
LIBFT = $(LIBFT_PATH)/libft.a
MLX = $(MLX_PATH)/libmlx.a

# Nom du programme
NAME = fractol

# Cible par défaut
all: $(NAME)

# Lier les fichiers objets et créer l'exécutable
$(NAME): $(OBJ_FILES) $(LIBFT) $(MLX)
	@$(CC) $(CFLAGS) -o $@ $^ -L$(LIBFT_PATH) -lft -L$(MLX_PATH) -lmlx -lXext -lX11
	@echo "$(NAME): $(GREEN)$(NAME) was created$(RESET)"

# Compiler les fichiers sources en objets
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(CFLAGS) -I$(INCLUDE_DIR) -I$(LIBFT_PATH) -I$(MLX_PATH) -c -o $@ $<
	@echo "$(NAME): $(GREEN)Object file $@ was created$(RESET)"

# Construire la libft
$(LIBFT):
	@$(MAKE) -C $(LIBFT_PATH)
	@echo "$(NAME): $(GREEN)$(LIBFT) was created$(RESET)"

# Construire la MiniLibX
$(MLX):
	@$(MAKE) -C $(MLX_PATH)
	@echo "$(NAME): $(GREEN)$(MLX) was created$(RESET)"

# Nettoyer les objets
clean:
	@$(MAKE) -C $(LIBFT_PATH) clean
	@$(MAKE) -C $(MLX_PATH) clean
	@rm -rf $(OBJ_DIR)
	@echo "$(NAME): $(RED)$(OBJ_DIR) was deleted$(RESET)"
	@echo "$(NAME): $(RED)object files were deleted$(RESET)"

# Nettoyer complètement
fclean: clean
	@$(MAKE) -C $(LIBFT_PATH) fclean
	@echo "$(NAME): $(RED)$(LIBFT) was deleted$(RESET)"
	@rm -f $(NAME)
	@echo "$(NAME): $(RED)$(NAME) was deleted$(RESET)"

# Refaire le projet
re: fclean all

# Déclarer les cibles comme ne devant pas être des fichiers
.PHONY: all clean fclean re
