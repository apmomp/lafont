# -*- coding: utf-8 -*-
require 'faker'

namespace :db do
  desc 'Fill db with sample data'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    create_sections
    create_bill_states
    fill_all
  end
end

def create_sections
  Section.create!(:name => "Restaurante")
  Section.create!(:name => "Bar")
  Section.create!(:name => "Suplementos")
end

def create_bill_states
  BillState.create!(:name => "Penfiente")
  BillState.create!(:name => "Pagado efectivo")
  BillState.create!(:name => "Pagado tarjeta")
end
def fill_all
  #Salchichas
  pr = [{:name => "Frankfurt", :price => 2.50},
        {:name => "Super Frankfurt", :price => 3.20},
        {:name => "Bratwurst", :price => 2.85},
        {:name => "Frikandela", :price => 2.80},
        {:name => "Cervela", :price => 2.85},
        {:name => "Pikanwurst", :price => 2.75},
        {:name => "Bockwurst", :price => 2.75},
        {:name => "Krakosky", :price => 2.75},
        {:name => "Grobe", :price => 2.75},
        {:name => "País", :price => 2.55},
        {:name => "Butifarra de payés", :price => 2.95},
        {:name => "Malagueña", :price => 2.85},
        {:name => "Tirolesa", :price => 2.75},
        {:name => "Chistorra", :price => 2.75},
        {:name => "Criollo", :price => 2.90},
        {:name => "Perol", :price => 2.75},
        {:name => "Pinchos", :price => 3.50}]

  fill("Salchichas", pr, 1)

  #Hamburguesas
  pr = [{:name => "Hamburguesa normal", :price => 2.80},
        {:name => "Hamburguesa picante", :price => 2.95},
        {:name => "Hamburguesa doble", :price => 4},
        {:name => "Hamburguesa moruna", :price => 2.95}]
  fill("Hamburguesas", pr, 1)

  #Combinaciones frankfurt
  pr = [{:name => "Yupi", :desc => "Frankfurt, queso, cebolla, bacon y mayonesa", :price => 4.75},
        {:name => "Mexicano", :desc => "Frankfurt, cebolla, queso, salsa picante", :price => 4.20},
        {:name => "Serranito", :desc => "Frankfurt, jamón país y queso", :price => 4.45},
        {:name => "Jona", :desc => "Frankfurt, queso y bacon", :price => 4.10},
        {:name => "Frankfurt Blue", :desc => "Frankfurt y salsa roquefort", :price => 3.30},
        {:name => "Frankfurt La Font", :desc => "Butifarra país, pan con tomate, queso y salsa de carne", :price => 3.90}]
  fill("Combinaciones frankfurt", pr, 1)

  #Combinaciones hamburguesas
  pr = [{:name => "Explosiva", :desc => "Hamburguesa, bacon, huevo frito y queso", :price => 4.95},
        {:name => "Bomba", :desc => "Hamburguesa picante, bacon, huevo frito y queso", :price => 5},
        {:name => "Mexicana", :desc => "Hamburguesa picante, cebolla y queso", :price => 4.50},
        {:name => "Porky", :desc => "Hamburguesa, cebolla, bacon y salsa roquefort", :price => 4.60},
        {:name => "Pink", :desc => "Hamburguesa, huevo duro, lechuga y salsa rosa", :price => 4.60},
        {:name => "Hamburguesa Blue", :desc => "Hamburguesa y salsa roquefort", :price => 3.60},
        {:name => "Tropical", :desc => "Hamburguesa, lechuga, piña y mayonesa", :price => 4.60},
        {:name => "Vegetal hamburguesa", :desc => "Hamburguesa, lechuga, tomate y mayonesa", :price => 4},
        {:name => "Hamburguesa La Font", :desc => "Hamburguesa, cebolla, queso, bacon, tomate y lechuga", :price => 6}]
  fill("Combinaciones hamburguesas", pr, 1)

  #Lomos
  pr = [{:name => "Lomo", :price => 2.90},
        {:name => "Español", :desc => "Lomo, jamón país y queso", :price => 4.90},
        {:name => "Lomo loco", :desc => "Lomo, bacon, jamón york y queso", :price => 5.20},
        {:name => "Librito", :desc => "Lomo, Jamón york plancha y queso", :price => 4.70},
        {:name => "Lomo Blue", :desc => "Lomo y salsa roquefort", :price => 3.70},
        {:name => "Inspiración", :desc => "Lomo, bacon, lechuga, tomate, salsa verde y salsa de carne", :price => 4.50},
        {:name => "Loquillo", :desc => "Lomo, pimiento, salsa verde", :price => 3.80},
        {:name => "Vegetal lomo", :desc => "Lomo, lechuga, tomate y mayonesa", :price => 4.10},
        {:name => "Lomo La Font", :price => 4.70}]
  fill("Lomos", pr, 1)

  #Terneras
  pr = [{:name => "Ternera", :price => 3.50},
        {:name => "Pelón", :desc => "Ternera, queso y pimientos", :price => 5.10},
        {:name => "Quebó", :desc => "Ternera, queso y cebolla", :price => 4.90},
        {:name => "Ternotronic", :desc => "Ternera, bacon y queso", :price => 5.10},
        {:name => "Pepito", :desc => "Ternera, jamón, queso y pimiento", :price => 5.90},
        {:name => "Vegetal ternera", :desc => "Ternera, lechuga, tomate y mayonesa", :price => 4.70},
        {:name => "Ternera Blue", :desc => "Ternera y salsa roquefort", :price => 4.30}]
  fill("Terneras", pr, 1)

  #Bacons
  pr = [{:name => "Bacon", :price => 2.50},
        {:name => "Bacon completo", :desc => "Bacon, cebolla y queso", :price => 3.90},
        {:name => "Fenómeno", :desc => "Bacon, queso y pimiento", :price => 4.10},
        {:name => "Josther", :desc => "Bacon y huevo frito", :price => 3.50},
        {:name => "Bacon Blue", :desc => "Bacon y salsa roquefort", :price => 3.30}]
  fill("Bacons", pr, 1)

  #Pollos
  pr = [{:name => "Pollo", :price => 3},
        {:name => "Kiki", :desc => "Pollo y salsa verde", :price => 3.50},
        {:name => "Tarao", :desc => "Pollo, bacon y queso", :price => 4.70},
        {:name => "Pollo Blue", :desc => "Pollo y salsa roquefort", :price => 3.50},
        {:name => "Pichoncillo", :desc => "Pollo, cebolla y pepinillo", :price => 4},
        {:name => "Vegetal pollo", :desc => "Pollo, lechuga, tomate y mayonesa", :price => 4.20},
        {:name => "Pollo La Font", :desc => "Pollo, jamón país y all i oli", :price => 4.80}]
  fill("Pollos", pr, 1)

  #Tortillas/Bikinis
  pr = [{:name => "Tortilla queso", :price => 3.30},
        {:name => "Tortilla cebolla", :price => 3.10},
        {:name => "Tortilla jamón york", :price => 3.30},
        {:name => "Tortilla jamón país", :price => 3.50},
        {:name => "Tortilla atún", :price => 3.50},
        {:name => "Tortilla chorizo", :price => 3.40},
        {:name => "Tortilla patatas chips", :price => 3.70},
        {:name => "Normal", :desc => "Jamón york y queso", :price => 2.60},
        {:name => "Mayorquín", :desc => "Sobrasada y queso", :price => 2.90},
        {:name => "Bikini La Font", :desc => "Jamón york, queso y huevo frito", :price => 3.70},
        {:name => "Salaito", :desc => "Jamón país y queso", :price => 3}]
  fill("Tortillas/Bikinis", pr, 1)

  #Tapas
  pr = [{:name => "Patatas bravas", :price => 3.50},
        {:name => "Patatas La Font", :price => 3.90},
        {:name => "Patatas fritas", :price => 2.50},
        {:name => "Pinchos morunos", :price => 4},
        {:name => "Nuggets", :price => 3.50},
        {:name => "Microcroquetas", :price => 3.50},
        {:name => "Surtido de salchichas", :price => 5},
        {:name => "Diablillos", :price => 4.50},
        {:name => "Plato jamón ibérico", :price => 9},
        {:name => "Plato queso manchego", :price => 5},
        {:name => "Combinado queso/jamón", :price => 12},
        {:name => "Berberechos", :price => 6.50},
        {:name => "Boquerones", :price => 5},
        {:name => "Olivas", :price => 2.40},
        {:name => "Patatas bolsa", :price => 1.20}]
  fill("Tapas", pr, 1)

  #Bocadillos fríos
  pr = [{:name => "Boc. jamón york", :price => 2.30},
        {:name => "Boc. jamón país", :price => 3},
        {:name => "Boc. jamón ibérico", :price => 5.50},
        {:name => "Boc. fuet", :price => 2.60},
        {:name => "Boc. chorizo", :price => 2.60},
        {:name => "Boc. salchichón", :price => 2.60},
        {:name => "Boc. queso tierno", :price => 2.60},
        {:name => "Boc. queso manchego", :price => 3},
        {:name => "Boc. catalana", :price => 2.60},
        {:name => "Boc. atún", :price => 3},
        {:name => "Boc. sobrasada", :price => 2.60},
        {:name => "Boc. butifarra blanca", :price => 2.60},
        {:name => "Boc. butifarra negra", :price => 2.60},
        {:name => "Boc. boquerones", :price => 3.60},
        {:name => "Vegetal atún", :desc => "Atún, lechuga, tomate, mayonesa", :price => 3.80},
        {:name => "Vegetal jamón york", :desc => "Jamón york, lechuga, tomate y mayonesa", :price => 3.40},
        {:name => "Vegetal jamón país", :desc => "Jamón país, lechuga, tomate y mayonesa", :price => 4.10}]
  fill("Bocadillos fríos", pr, 1)

  #Platos combinados
  pr = [{:name => "Combi 5-1", :desc => "Ensalada, patatas y huevo", :price => 5},
        {:name => "Combi 5-2", :desc => "Patatas, huevo y frankfurt", :price => 5},
        {:name => "Combi 5-3", :desc => "Patatas, huevo, chistorra", :price => 5},
        {:name => "Combi 5-4", :desc => "Patatas y lomo", :price => 5},
        {:name => "Combi 6-1", :desc => "Ensalada, patatas, hambuerguesa", :price => 6},
        {:name => "Combi 6-2", :desc => "Ensalada, patatas, lomo", :price => 6},
        {:name => "Combi 6-3", :desc => "Ensalada, patatas, pollo", :price => 6},
        {:name => "Combi 6-4", :desc => "Ensalada, patatas, ternera", :price => 6},
        {:name => "Combi 6-5", :desc => "Ensalada, patatas, frankfurt", :price => 6},
        {:name => "Combi 6-6", :desc => "Ensalada, patatas, butifarra", :price => 6},
        {:name => "Combi 6-7", :desc => "Patatas, huevo y bacon", :price => 6},
        {:name => "Combi 6-8", :desc => "Patatas, lomo y pimientos", :price => 6},
        {:name => "Combi 6-9", :desc => "Patatas, hamburguesa y huevo", :price => 6},
        {:name => "Combi 7-1", :desc => "Ensalada, patatas y pinchos", :price => 7},
        {:name => "Combi 7-2", :desc => "Patatas, lomo, pimientos y huevo", :price => 7},
        {:name => "Ensalada verde", :desc => "Lechuga, tomate, cebolla, pimiento y olivas", :price => 5},
        {:name => "Ensalada atún", :desc => "Lechuga, tomate, cebolla, atún, pimiento y olivas", :price => 5.50},
        {:name => "Ensalada La Font", :desc => "Lechuga, tomate, cebolla, pollo, maíz y mayonesa", :price => 6.90}]
  fill("Platos combinados", pr, 1)

  #Refrescos
  pr = [{:name => "Coca Cola", :price => 1.80},
        {:name => "Coca Cola Zero", :price => 1.80},
        {:name => "Coca Cola Light", :price => 1.80},
        {:name => "Nestea", :price => 1.80},
        {:name => "Fanta naranja", :price => 1.80},
        {:name => "Fanta limón", :price => 1.80},
        {:name => "Sprite", :price => 1.80},
        {:name => "Trina", :price => 1.60},
        {:name => "Zumo melocotón", :price => 1.60},
        {:name => "Zumo naranja", :price => 1.60},
        {:name => "Zumo piña", :price => 1.60},
        {:name => "Bitter Kas", :price => 1.70},
        {:name => "Schweppes", :price => 1.60},
        {:name => "Aquarius", :price => 1.80},
        {:name => "Agua", :price => 1},
        {:name => "Agua gas", :price => 1.20},
        {:name => "Cacaolat", :price => 1.85},
        {:name => "Red Bull", :price => 2.50},
        {:name => "Coca Cola 200cl", :price => 1.60},
        {:name => "Fanta 200cl", :price => 1.60}]
  fill("Refrescos", pr, 2)

  #Cervezas
  pr = [{:name => "Estrella Galicia", :price => 1.60},
        {:name => "Estrella Galicia sin", :price => 1.80},
        {:name => "Voll Damm", :price => 1.70},
        {:name => "Caña 0,20", :price => 1.40},
        {:name => "Caña 0,30", :price => 1.70},
        {:name => "Jarra", :price => 3.50},
        {:name => "Tostada 0,20", :price => 2},
        {:name => "Tostada 0,30", :price => 1.70},
        {:name => "Jarra tostada", :price => 4},
        {:name => "Clara 0,20", :price => 1.40},
        {:name => "Clara 0,30", :price => 1.70},
        {:name => "Jarra clara", :price => 4},
        {:name => "Estrella Galicia 1906", :price => 1.70},
        {:name => "Heineken", :price => 2.30},
        {:name => "Budêjovicky", :price => 2.30},
        {:name => "Coronita", :price => 2.30},
        {:name => "Voll Damm (Quinto)", :price => 1.40},
        {:name => "Salitos", :price => 2.30},
        {:name => "Desperados", :price => 2.50},
        {:name => "Alhambra", :price => 2.30},
        {:name => "San Miguel Selecta", :price => 2.30}]
  fill("Cervezas", pr, 2)

  #Cafés
  pr = [{:name => "Café", :price => 1.05},
        {:name => "Cortado", :price => 1.20},
        {:name => "Café con leche", :price => 1.30},
        {:name => "Café descafeinado", :price => 1.10},
        {:name => "Cortado descafeinado", :price => 1.25},
        {:name => "Café con leche descafeinado", :price => 1.35},
        {:name => "Americano", :price => 1.30},
        {:name => "Café bombón", :price => 1.50},
        {:name => "Carajillo anís", :price => 1.45},
        {:name => "Carajillo coñac", :price => 1.65},
        {:name => "Carajillo whisky", :price => 1.85},
        {:name => "Carajillo baileys", :price => 1.85},
        {:name => "Carajillo ron", :price => 1.85},
        {:name => "Carajillo magno", :price => 1.70},
        {:name => "Trifásico whisky", :price => 1.95},
        {:name => "Trifásico coñac", :price => 1.85},
        {:name => "Trifásico baileys", :price => 1.95},
        {:name => "Colacao", :price => 1.25},
        {:name => "Manzanilla", :price => 1.20},
        {:name => "Poleo menta", :price => 1.20},
        {:name => "Tila", :price => 1.20},
        {:name => "Té", :price => 1.20},
        {:name => "Té selecto", :price => 1.60},
        {:name => "Vaso leche", :price => 1.20},
        {:name => "Chocolate", :price => 2},
        {:name => "Capuchino", :price => 1.80},
        {:name => "Suizo", :price => 2.50},
        {:name => "Té con leche", :price => 1.50},
        {:name => "Café irlandés", :price => 4}]
  fill("Cafés", pr, 2)

  #Suplementos
  pr = [{:name => "Tomate", :price => 0.60},
        {:name => "Lechuga", :price => 0.60},
        {:name => "Cebolla", :price => 0.60},
        {:name => "Pepinillo", :price => 0.60},
        {:name => "Queso", :price => 0.80},
        {:name => "Pimiento", :price => 0.80},
        {:name => "Suplemento Bacon", :price => 1},
        {:name => "Huevo", :price => 0.90}]
  fill("Suplementos", pr, 3)
  
end

def fill(cat_name, pr, sec)
  cat = FoodCat.create!(:name => cat_name, :section_id => sec)

  pr.each do |product|
    cat.foods.create!(product)
  end
end

