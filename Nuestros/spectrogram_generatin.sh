#!/bin/bash

# Carpeta con los archivos .wav
input_dir="web/"   # podés cambiar esto por el path que quieras
output_dir="Imag/"  # carpeta donde guardar los PNG

# Crear carpeta de salida si no existe
mkdir -p "$output_dir"

# Recorrer todos los archivos .wav en la carpeta
for file in "$input_dir"/*.wav; do
    # Verificar que haya archivos .wav
    [ -e "$file" ] || continue

    # Obtener el nombre base (sin extensión)
    base=$(basename "$file" .wav)

    # Crear el espectrograma
    echo "Generando espectrograma para $file..."
    sox "$file" -n spectrogram -r -o "$output_dir/$base.png"
done

echo "Listo. Los espectrogramas están en $output_dir"
