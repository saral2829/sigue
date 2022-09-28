--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: almacen_productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE almacen_productos (
    alm_pro_id integer NOT NULL,
    alm_id integer,
    prod_id integer,
    cantidad integer,
    stock_max integer,
    stock_min integer,
    precio_compra numeric,
    precio_venta numeric,
    unidad_principal integer,
    emp_reg integer,
    fh_reg timestamp without time zone
);


ALTER TABLE public.almacen_productos OWNER TO postgres;

--
-- Name: almacen_productos_alm_pro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE almacen_productos_alm_pro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.almacen_productos_alm_pro_id_seq OWNER TO postgres;

--
-- Name: almacen_productos_alm_pro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE almacen_productos_alm_pro_id_seq OWNED BY almacen_productos.alm_pro_id;


--
-- Name: almacenes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE almacenes (
    alm_id integer NOT NULL,
    alm_nombre character varying(250),
    suc_id integer,
    activo boolean
);


ALTER TABLE public.almacenes OWNER TO postgres;

--
-- Name: almacenes_alm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE almacenes_alm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.almacenes_alm_id_seq OWNER TO postgres;

--
-- Name: almacenes_alm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE almacenes_alm_id_seq OWNED BY almacenes.alm_id;


--
-- Name: area; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE area (
    id_area integer NOT NULL,
    nombre_area character varying(120),
    descripcion_area text,
    estado_area character(1)
);


ALTER TABLE public.area OWNER TO postgres;

--
-- Name: area_id_area_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE area_id_area_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.area_id_area_seq OWNER TO postgres;

--
-- Name: area_id_area_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner:postgres
--

ALTER SEQUENCE area_id_area_seq OWNED BY area.id_area;


--
-- Name: caracteristicas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE caracteristicas (
    idcaracteristica integer NOT NULL,
    nombre_caracteristica character varying(250),
    tipo_caracteristica character(1),
    caracteristica_padre integer,
    estado character(1),
    ref_proveedor character(1)
);


ALTER TABLE public.caracteristicas OWNER TO postgres;

--
-- Name: COLUMN caracteristicas.ref_proveedor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN caracteristicas.ref_proveedor IS 'indicar si se tomara como referencia para proveedor';


--
-- Name: caracteristicas_idcaracteristica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE caracteristicas_idcaracteristica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caracteristicas_idcaracteristica_seq OWNER TO postgres;

--
-- Name: caracteristicas_idcaracteristica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE caracteristicas_idcaracteristica_seq OWNED BY caracteristicas.idcaracteristica;


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categorias (
    idcategoria integer NOT NULL,
    nombre_categoria character varying(120),
    descripcion_categoria text,
    vigencia_categoria character(1),
    categoria_padre integer
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE categoria_idcategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_idcategoria_seq OWNER TO postgres;

--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE categoria_idcategoria_seq OWNED BY categorias.idcategoria;


--
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compras (
    comp_id integer NOT NULL,
    suc_id integer,
    emp_reg integer,
    fh_reg timestamp without time zone
);


ALTER TABLE public.compras OWNER TO postgres;

--
-- Name: compras_comp_id_seq; Type: SEQUENCE; Schema: public; Owner:postgres
--

CREATE SEQUENCE compras_comp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_comp_id_seq OWNER TO postgres;

--
-- Name: compras_comp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compras_comp_id_seq OWNED BY compras.comp_id;


--
-- Name: compras_det; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE compras_det (
    comp_det_id integer NOT NULL,
    comp_id integer,
    prod_id integer,
    prov_id integer,
    uni_id integer,
    cantidad integer,
    emp_reg integer,
    fh_reg timestamp without time zone
);


ALTER TABLE public.compras_det OWNER TO postgres;

--
-- Name: compras_det_comp_det_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE compras_det_comp_det_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compras_det_comp_det_id_seq OWNER TO postgres;

--
-- Name: compras_det_comp_det_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE compras_det_comp_det_id_seq OWNED BY compras_det.comp_det_id;


--
-- Name: iconos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE iconos (
    id_icono integer NOT NULL,
    icono_descr character varying(60)
);


ALTER TABLE public.iconos OWNER TO postgres;

--
-- Name: iconos_id_icono_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE iconos_id_icono_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iconos_id_icono_seq OWNER TO postgres;

--
-- Name: iconos_id_icono_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE iconos_id_icono_seq OWNED BY iconos.id_icono;


--
-- Name: igv; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE igv (
    id_igv integer NOT NULL,
    valor_igv double precision,
    fecha_igv date,
    id_per integer
);


ALTER TABLE public.igv OWNER TO postgres;

--
-- Name: igv_id_igv_seq; Type: SEQUENCE; Schema: public; Owner:postgres
--

CREATE SEQUENCE igv_id_igv_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.igv_id_igv_seq OWNER TO postgres;

--
-- Name: igv_id_igv_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE igv_id_igv_seq OWNED BY igv.id_igv;


--
-- Name: linea; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE linea (
    idlinea integer NOT NULL,
    nombre_linea character varying(120),
    descripcion_linea text,
    vigencia_linea bit(1)
);


ALTER TABLE public.linea OWNER TO postgres;

--
-- Name: linea_idlinea_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE linea_idlinea_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.linea_idlinea_seq OWNER TO postgres;

--
-- Name: linea_idlinea_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE linea_idlinea_seq OWNED BY linea.idlinea;


--
-- Name: menu; Type: TABLE; Schema: public; Owner:postgres; Tablespace: 
--

CREATE TABLE menu (
    id_menu integer NOT NULL,
    descripcion character varying(120),
    link character varying(250),
    menu_padre integer,
    id_icono integer,
    orden integer
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_id_menu_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_menu_seq OWNER TO postgres;

--
-- Name: menu_id_menu_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_id_menu_seq OWNED BY menu.id_menu;


--
-- Name: menu_perfil; Type: TABLE; Schema: public; Owner:postgres; Tablespace: 
--

CREATE TABLE menu_perfil (
    id_menu_perfil integer NOT NULL,
    id_menu integer,
    id_perfil integer
);


ALTER TABLE public.menu_perfil OWNER TO postgres;

--
-- Name: menu_perfil_id_menu_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menu_perfil_id_menu_perfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_perfil_id_menu_perfil_seq OWNER TO postgres;

--
-- Name: menu_perfil_id_menu_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menu_perfil_id_menu_perfil_seq OWNED BY menu_perfil.id_menu_perfil;


--
-- Name: pedido_compra_det; Type: TABLE; Schema: public; Owner:postgres; Tablespace: 
--

CREATE TABLE pedido_compra_det (
    ped_det_id integer NOT NULL,
    id_pedido integer,
    id_producto integer,
    id_unidad integer,
    cantidad integer,
    emp_reg integer,
    fh_reg timestamp without time zone
);


ALTER TABLE public.pedido_compra_det OWNER TO postgres;

--
-- Name: pedido_compra_det_ped_det_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedido_compra_det_ped_det_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_compra_det_ped_det_id_seq OWNER TO postgres;

--
-- Name: pedido_compra_det_ped_det_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_compra_det_ped_det_id_seq OWNED BY pedido_compra_det.ped_det_id;


--
-- Name: pedido_compras; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pedido_compras (
    pec_id integer NOT NULL,
    suc_id integer,
    emp_reg integer,
    fh_reg timestamp without time zone,
    idproveedor integer
);


ALTER TABLE public.pedido_compras OWNER TO postgres;

--
-- Name: pedido_compras_pec_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pedido_compras_pec_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pedido_compras_pec_id_seq OWNER TO postgres;

--
-- Name: pedido_compras_pec_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pedido_compras_pec_id_seq OWNED BY pedido_compras.pec_id;


--
-- Name: perfil; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE perfil (
    id_perfil integer NOT NULL,
    nombre_perfil character varying(250)
);


ALTER TABLE public.perfil OWNER TO postgres;

--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE perfil_id_perfil_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.perfil_id_perfil_seq OWNER TO postgres;

--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE perfil_id_perfil_seq OWNED BY perfil.id_perfil;


--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    id_per integer NOT NULL,
    dni character(8),
    nombres_per character varying(250),
    apellidopat_per character varying(60),
    apellidomat_per character varying(60),
    sexo character(1),
    fechanac_per date,
    direccion_per text,
    telefonocel_per character varying(15),
    correo_per character varying(70),
    telefonofij_per character varying(15),
    facebook_per character varying(45),
    tipo_per character varying(45),
    ruc_per character varying(11),
    razonsoc_per character varying(120),
    empleado character varying(1),
    area_id integer,
    claveusu_per character varying(120),
    estadocli_per character(1),
    perfil_id_per integer,
    ubigeo_id_ubi integer,
    proveedor character(1),
    user_reg integer,
    fh_reg timestamp without time zone,
    caract_ref integer,
    per_suc_id integer
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: COLUMN persona.tipo_per; Type: COMMENT; Schema: public; Owner:postgres
--

COMMENT ON COLUMN persona.tipo_per IS 'para determinar si es cliente natural o juridico';


--
-- Name: COLUMN persona.empleado; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN persona.empleado IS '1 --- es cliente y empleado

0----es cliente';


--
-- Name: COLUMN persona.caract_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN persona.caract_ref IS 'caracteristica de referencia en caso de ser proveedor';


--
-- Name: persona_id_per_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_id_per_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_id_per_seq OWNER TO postgres;

--
-- Name: persona_id_per_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_id_per_seq OWNED BY persona.id_per;


--
-- Name: persona_per_suc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE persona_per_suc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persona_per_suc_id_seq OWNER TO postgres;

--
-- Name: persona_per_suc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE persona_per_suc_id_seq OWNED BY persona.per_suc_id;


--
-- Name: producto_caracteristica; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto_caracteristica (
    idproducto_caracteristica integer NOT NULL,
    idproducto integer,
    idcaracteristica integer
);


ALTER TABLE public.producto_caracteristica OWNER TO postgres;

--
-- Name: producto_caracteristica_idproducto_caracteristica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_caracteristica_idproducto_caracteristica_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_caracteristica_idproducto_caracteristica_seq OWNER TO postgres;

--
-- Name: producto_caracteristica_idproducto_caracteristica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE producto_caracteristica_idproducto_caracteristica_seq OWNED BY producto_caracteristica.idproducto_caracteristica;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE productos (
    idproducto integer NOT NULL,
    nombre_producto character varying(250),
    idcategoria integer,
    idproveedor integer,
    estado character(1),
    user_reg integer,
    fh_reg timestamp without time zone
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: producto_idproducto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_idproducto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_idproducto_seq OWNER TO postgres;

--
-- Name: producto_idproducto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE producto_idproducto_seq OWNED BY productos.idproducto;


--
-- Name: producto_unidadmedida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE producto_unidadmedida (
    id_producto_unidadmedida integer NOT NULL,
    idproducto integer,
    idunidad integer
);


ALTER TABLE public.producto_unidadmedida OWNER TO postgres;

--
-- Name: producto_unidadmedida_id_producto_unidadmedida_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE producto_unidadmedida_id_producto_unidadmedida_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_unidadmedida_id_producto_unidadmedida_seq OWNER TO postgres;

--
-- Name: producto_unidadmedida_id_producto_unidadmedida_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE producto_unidadmedida_id_producto_unidadmedida_seq OWNED BY producto_unidadmedida.id_producto_unidadmedida;


--
-- Name: sucursal; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sucursal (
    id_sucursal integer NOT NULL,
    razonsoc_suc character varying(120),
    direccionsuc_suc character varying(120),
    direccionalm_suc character varying(120),
    telefonofij_suc character varying(9),
    telefonocel_suc character varying(9),
    ubigeo_id_ubi integer,
    idalmacen integer,
    estado_suc character(1)
);


ALTER TABLE public.sucursal OWNER TO postgres;

--
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sucursal_id_sucursal_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sucursal_id_sucursal_seq OWNER TO postgres;

--
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sucursal_id_sucursal_seq OWNED BY sucursal.id_sucursal;


--
-- Name: tipo_categoria; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_categoria (
    id_tipocategoria integer NOT NULL,
    nombre_tipocategoria character varying(120)
);


ALTER TABLE public.tipo_categoria OWNER TO postgres;

--
-- Name: tipo_categoria_id_tipocategoria_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipo_categoria_id_tipocategoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_categoria_id_tipocategoria_seq OWNER TO postgres;

--
-- Name: tipo_categoria_id_tipocategoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipo_categoria_id_tipocategoria_seq OWNED BY tipo_categoria.id_tipocategoria;


--
-- Name: ubigeo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ubigeo (
    id_ubigeo integer NOT NULL,
    departamento_ubi character varying(60),
    provincia_ubi character varying(60),
    distrito_ubi character varying(60)
);


ALTER TABLE public.ubigeo OWNER TO postgres;

--
-- Name: ubigeo_id_ubigeo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE ubigeo_id_ubigeo_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ubigeo_id_ubigeo_seq OWNER TO postgres;

--
-- Name: ubigeo_id_ubigeo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE ubigeo_id_ubigeo_seq OWNED BY ubigeo.id_ubigeo;


--
-- Name: unidad_medida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidad_medida (
    id_unidadmedida integer NOT NULL,
    unidadmed_ume character varying(30),
    abreviatura_ume character varying(5),
    vigencia_ume character(1)
);


ALTER TABLE public.unidad_medida OWNER TO postgres;

--
-- Name: unidad_medida_id_unidadmedidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidad_medida_id_unidadmedidad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidad_medida_id_unidadmedidad_seq OWNER TO postgres;

--
-- Name: unidad_medida_id_unidadmedidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidad_medida_id_unidadmedidad_seq OWNED BY unidad_medida.id_unidadmedida;


--
-- Name: alm_pro_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacen_productos ALTER COLUMN alm_pro_id SET DEFAULT nextval('almacen_productos_alm_pro_id_seq'::regclass);


--
-- Name: alm_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY almacenes ALTER COLUMN alm_id SET DEFAULT nextval('almacenes_alm_id_seq'::regclass);


--
-- Name: id_area; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area ALTER COLUMN id_area SET DEFAULT nextval('area_id_area_seq'::regclass);


--
-- Name: idcaracteristica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY caracteristicas ALTER COLUMN idcaracteristica SET DEFAULT nextval('caracteristicas_idcaracteristica_seq'::regclass);


--
-- Name: idcategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorias ALTER COLUMN idcategoria SET DEFAULT nextval('categoria_idcategoria_seq'::regclass);


--
-- Name: comp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compras ALTER COLUMN comp_id SET DEFAULT nextval('compras_comp_id_seq'::regclass);


--
-- Name: comp_det_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compras_det ALTER COLUMN comp_det_id SET DEFAULT nextval('compras_det_comp_det_id_seq'::regclass);


--
-- Name: id_icono; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY iconos ALTER COLUMN id_icono SET DEFAULT nextval('iconos_id_icono_seq'::regclass);


--
-- Name: id_igv; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY igv ALTER COLUMN id_igv SET DEFAULT nextval('igv_id_igv_seq'::regclass);


--
-- Name: idlinea; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY linea ALTER COLUMN idlinea SET DEFAULT nextval('linea_idlinea_seq'::regclass);


--
-- Name: id_menu; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu ALTER COLUMN id_menu SET DEFAULT nextval('menu_id_menu_seq'::regclass);


--
-- Name: id_menu_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menu_perfil ALTER COLUMN id_menu_perfil SET DEFAULT nextval('menu_perfil_id_menu_perfil_seq'::regclass);


--
-- Name: ped_det_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_compra_det ALTER COLUMN ped_det_id SET DEFAULT nextval('pedido_compra_det_ped_det_id_seq'::regclass);


--
-- Name: pec_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pedido_compras ALTER COLUMN pec_id SET DEFAULT nextval('pedido_compras_pec_id_seq'::regclass);


--
-- Name: id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY perfil ALTER COLUMN id_perfil SET DEFAULT nextval('perfil_id_perfil_seq'::regclass);


--
-- Name: id_per; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN id_per SET DEFAULT nextval('persona_id_per_seq'::regclass);


--
-- Name: per_suc_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona ALTER COLUMN per_suc_id SET DEFAULT nextval('persona_per_suc_id_seq'::regclass);


--
-- Name: idproducto_caracteristica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto_caracteristica ALTER COLUMN idproducto_caracteristica SET DEFAULT nextval('producto_caracteristica_idproducto_caracteristica_seq'::regclass);


--
-- Name: id_producto_unidadmedida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY producto_unidadmedida ALTER COLUMN id_producto_unidadmedida SET DEFAULT nextval('producto_unidadmedida_id_producto_unidadmedida_seq'::regclass);


--
-- Name: idproducto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos ALTER COLUMN idproducto SET DEFAULT nextval('producto_idproducto_seq'::regclass);


--
-- Name: id_sucursal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sucursal ALTER COLUMN id_sucursal SET DEFAULT nextval('sucursal_id_sucursal_seq'::regclass);


--
-- Name: id_tipocategoria; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipo_categoria ALTER COLUMN id_tipocategoria SET DEFAULT nextval('tipo_categoria_id_tipocategoria_seq'::regclass);


--
-- Name: id_ubigeo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ubigeo ALTER COLUMN id_ubigeo SET DEFAULT nextval('ubigeo_id_ubigeo_seq'::regclass);


--
-- Name: id_unidadmedida; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidad_medida ALTER COLUMN id_unidadmedida SET DEFAULT nextval('unidad_medida_id_unidadmedidad_seq'::regclass);


--
-- Data for Name: almacen_productos; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: almacen_productos_alm_pro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('almacen_productos_alm_pro_id_seq', 1, false);


--
-- Data for Name: almacenes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: almacenes_alm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('almacenes_alm_id_seq', 1, false);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO area VALUES (1, 'RR.HH', 'RECURSOS HUMANOS', '1');
INSERT INTO area VALUES (2, 'VENTAS', 'AREA DE VENTAS', '1');
INSERT INTO area VALUES (3, 'ALMACEN', 'ALMACEN', '1');


--
-- Name: area_id_area_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('area_id_area_seq', 3, true);


--
-- Data for Name: caracteristicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO caracteristicas VALUES (4, 'MARCA', '1', NULL, '1', '1');
INSERT INTO caracteristicas VALUES (2, 'COLOR', '1', NULL, '1', '0');
INSERT INTO caracteristicas VALUES (141, 'MILK', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (11, 'RITZY', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (7, 'SCOMBRO', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (125, 'MALLA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (3, 'XS', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (5, 'S', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (6, 'M', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (126, 'PAJA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (13, 'L', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (14, 'XL', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (128, 'CUERO/LONA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (15, 'XXL', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (16, '28', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (17, '30', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (18, '32', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (19, '40', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (20, 'HUESO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (8, 'AMARILLO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (9, 'VERDE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (12, 'ROJO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (21, 'NEGRO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (22, 'AZUL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (23, 'BLANCO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (25, 'CELESTE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (26, 'GUINDA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (27, 'CREMA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (28, 'BEIGE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (29, 'MORADO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (30, 'MELÓN', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (31, 'ROSADO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (32, 'VINO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (33, 'AZULINO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (34, 'FRESA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (35, 'GRIS', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (36, 'NARANJA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (37, 'KAKI', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (38, 'NAVI', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (39, 'ROYAL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (40, 'AQUA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (41, 'PALO ROSA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (42, 'LACRE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (43, 'CLARO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (44, 'COBALTO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (45, 'BURGUNDI', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (46, 'OSCURO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (47, 'MOTEADO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (48, 'MOSTAZA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (49, 'VERDE JADE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (50, 'NUDE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (51, 'TURQUEZA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (52, 'FUCSIA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (53, 'CORAL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (54, 'PLOMO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (55, 'LILA LIGHT', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (56, 'ACERO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (57, 'WEDGEWOOD', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (58, 'NE/CR', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (59, 'CR/NE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (60, 'MAGENTA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (61, 'INTERMEDIO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (62, 'LILA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (63, 'VERDE MILI', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (64, 'VERDE FLOREADO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (65, 'AZUL FLOREADO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (83, 'ESTAMPADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (67, 'PLATA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (68, 'ORO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (69, 'GOCCOS', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (70, 'EVOLUTION', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (71, 'LAFEL', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (72, 'ZARA', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (73, 'SODA', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (74, 'CUELLO', '1', NULL, '1', '0');
INSERT INTO caracteristicas VALUES (75, 'CUELLO REDONDO', '2', 74, '1', '0');
INSERT INTO caracteristicas VALUES (76, 'CUELLO V', '2', 74, '1', '0');
INSERT INTO caracteristicas VALUES (77, 'CUELLO NERU', '2', 74, '1', '0');
INSERT INTO caracteristicas VALUES (78, 'CUELLO CAMISERO', '2', 74, '1', '0');
INSERT INTO caracteristicas VALUES (79, 'CUELLO TORTUGA', '2', 74, '1', '0');
INSERT INTO caracteristicas VALUES (80, 'DISEÑO', '1', NULL, '1', '0');
INSERT INTO caracteristicas VALUES (81, 'LISTADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (82, 'PARCHES', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (84, 'ENTERO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (85, 'BORDADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (86, 'RASGADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (87, 'LISTADO/PARCHES', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (88, 'LISTADO/ESTAMPADOS', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (89, 'LISTADO/RASGADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (90, 'LISTADO/BORDADOS', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (91, 'ENTERO/PARCHES', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (92, 'ENTERO/ESTAMPADOS', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (95, 'CAPUCHA', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (96, 'CARGO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (97, 'JOGGER', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (98, 'CAMUFLADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (99, 'MATERIAL', '1', NULL, '1', '0');
INSERT INTO caracteristicas VALUES (100, 'AFRANELADO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (101, 'CUERO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (102, 'DRILL', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (103, 'CORDUROY', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (104, 'JEAN', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (105, 'REVERSIBLE', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (108, 'HILO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (109, 'LANA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (110, 'SATINADO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (106, 'TAFETA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (112, 'ENCAJE', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (113, 'TELA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (114, 'PAÑO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (115, 'GAZA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (111, 'IMPERMEABLE(NYLON)', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (116, 'LICRA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (117, 'METAL', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (129, 'SINTÉTICO/LONA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (118, 'CAREY', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (119, 'METAL/CAREY', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (120, 'ALUMINIO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (121, 'TITANIUM', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (122, 'LONA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (123, 'TEJIDO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (130, 'CUERINA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (131, 'PIEDRERÍA', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (132, 'MODELO', '1', NULL, '1', '0');
INSERT INTO caracteristicas VALUES (133, 'RIVERA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (134, 'PRISCILL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (135, 'PIANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (136, 'FRANCIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (137, 'SELENA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (138, 'LIBIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (139, 'OSLO', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (140, 'MARRUECOS', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (10, 'ROY', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (142, 'SAMY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (1, 'TALLA', '1', NULL, '1', '0');
INSERT INTO caracteristicas VALUES (145, 'LISTADO/BOTÓN', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (146, 'ENTERO/BOTÓN', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (147, 'ELÁSTICO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (148, 'KASIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (149, 'ESTAMPADO/BOTÓN', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (150, 'AIDEN', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (151, 'CUADROS', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (152, 'CUADROS/BOTÓN', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (153, 'CHILI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (154, 'MARITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (155, 'CHALIS', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (93, 'ENTERO/BORDADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (124, 'PLASTICO(PVC)', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (127, 'SINTETICO', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (107, 'ALGODON', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (24, 'MARRON', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (156, 'LESLY LU', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (157, 'STANDAR', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (158, 'AZUL MARINO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (159, 'BROCHE', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (160, 'LISTADO/BROCHE', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (161, 'JEAN/GAZA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (162, 'LEYLA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (163, 'THAIS', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (164, 'JEAN/CHALIS', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (165, 'FLIPPY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (274, 'MILANDY III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (168, 'PERRY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (166, 'HUESO/MORADO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (167, 'HUESO/ROJO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (169, 'HUESO/TURQUEZA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (170, 'HUESO/FUCSIA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (171, 'LENY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (172, 'OXUS', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (173, 'BRISA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (174, 'FIORUCCI', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (175, 'VELANIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (176, 'FRESA/AZUL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (177, 'GDRMAG', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (178, 'RIPCURL', '2', 4, '1', '0');
INSERT INTO caracteristicas VALUES (179, '6', '2', 1, '1', '0');
INSERT INTO caracteristicas VALUES (180, 'DERBA II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (181, 'AIDEL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (182, 'TELA/ENCAJE', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (183, 'SALMÓN', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (184, 'VERDE AGUA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (185, 'MEKY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (186, 'ARIANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (187, 'ENTERO/BOTÓN MEDIO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (188, 'TAYLOR II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (189, 'IMANI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (190, 'ESTAMPADO/BOTÓN MEDIO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (191, 'FISHER', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (192, 'POCKET', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (193, 'FOREVER II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (194, 'INDONESIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (195, 'GERLAN', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (196, 'ENTERO/CIERRE', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (197, 'DRIKA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (198, 'FABIOLA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (199, 'CLAISA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (200, 'LAUREEN', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (201, 'DOREMI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (202, 'BRITANY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (203, 'GAZA/ENCAJE', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (204, 'BRESLA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (205, 'REYNA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (206, 'ENTERO/ELÁSTICO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (207, 'ESTAMPADO/ELÁSTICO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (208, 'ITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (209, 'KRISTIN', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (211, 'CARLIE', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (210, 'CUELLO RUMBERO', '2', 74, '1', '0');
INSERT INTO caracteristicas VALUES (212, 'LISTADO/ELÁSTICO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (213, 'RUBY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (214, 'AGUSTINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (223, 'BAMBI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (224, 'REGINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (225, 'MATILDA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (226, 'ROMEO', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (227, 'KIDRA III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (228, 'JEAN/TELA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (229, 'MIEL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (230, 'HUESO/NEGRO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (231, 'HUESO/AZUL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (232, 'TITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (233, 'BLANCO/AZUL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (234, 'BLANCO/NEGRO', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (235, 'ALICIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (236, 'CAELLI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (237, 'GAL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (238, 'IVRY III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (239, 'FRANCA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (240, 'LISA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (241, 'GIANI III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (242, 'DONATELLA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (243, 'COLORINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (244, 'SAMANTHA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (245, 'GRANATE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (246, 'AITANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (247, 'OTILIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (248, 'SERAFINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (249, 'HUESO/NARANJA', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (250, 'NEGRO/AZUL', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (251, 'NEGRO/BEIGE', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (252, 'DHARANI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (253, 'TULL', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (255, 'RAYON VISCOSA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (257, 'YIYI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (258, 'MATILDE', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (259, 'ESTAMPADO/BORDADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (260, 'ARLENE', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (261, 'MELANIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (262, 'OFELIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (263, 'LUZ', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (265, 'LAURA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (266, 'MARGARITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (267, 'MACY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (268, 'ZAMANTHA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (269, 'ROXANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (270, 'MILANO', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (271, 'POLI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (272, 'SALLYNI III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (273, 'RAYON', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (275, 'BARCELONA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (276, 'AFRICA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (277, 'MACARENA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (278, 'KATTA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (279, 'MAELA III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (280, 'ADRIANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (281, 'BETH', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (282, 'LISTADO/BORDADO/BOTÓN', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (283, 'MARIEL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (284, 'GABY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (285, 'COTO', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (286, 'ALEGRA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (287, 'FERIZ II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (288, 'ZURIE', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (289, 'CHARLOT III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (290, 'RAYON/ENCAJE', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (291, 'LYBAN V', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (292, 'ENAF', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (293, 'CORINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (294, 'RAYON/GAZA', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (295, 'GLEPSY II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (296, 'ENTERO/ENCAJE', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (297, 'JAKY III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (298, 'TINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (299, 'GIULIANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (300, 'LASHTI II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (301, 'CATRINA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (302, 'IMPERIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (303, 'FRANEL III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (304, 'FIORITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (305, 'SALMI II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (306, 'ESTAMPADO/ELASTICO/BOTON MEDIO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (308, 'GAZA/TULL', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (307, 'ALBA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (309, 'ANITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (310, 'YERAY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (311, 'PAYTON', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (312, 'ZULLY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (313, 'BLONDY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (314, 'SAMIRI III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (66, 'ACERO 1', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (315, 'MARIELLA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (316, 'FABIANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (317, 'KIARA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (318, 'ALCIRA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (319, 'SILVER', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (320, 'MALIBEA III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (321, 'SISY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (322, 'TANYA II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (323, 'ALIZA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (324, 'FLAIRI', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (325, 'URPA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (326, 'YARDAN', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (327, 'ARACELY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (328, 'KIMLA III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (329, 'ARLET', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (330, 'PELKA III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (331, 'EDY IV', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (332, 'KENZO', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (333, 'AMBAR', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (334, 'EVANNA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (335, 'YVONE III', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (94, 'ENTERO/RASGADO', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (336, 'ENTERO/RASGADO/BOTON', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (337, 'ENTERO/BORDADO/BOTON', '2', 80, '1', '0');
INSERT INTO caracteristicas VALUES (338, 'ZAIDA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (339, 'ELIANA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (340, 'LOLA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (341, 'NOHELI II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (342, 'LEDIS', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (343, 'ALGODON/GAZA/TULL', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (344, 'NEW', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (345, 'ALGODON/TULL', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (264, 'ALGODON/ENCAJE', '2', 99, '1', '0');
INSERT INTO caracteristicas VALUES (346, 'GREBITA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (347, 'FLICA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (348, 'SHERYL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (349, 'JANET', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (350, 'ENCAJE RAYAS', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (351, 'CROP ITZEL', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (352, 'KIRIM', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (353, 'SAILOR', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (354, 'MULTI 1', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (355, 'MERRIET', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (356, 'FERNINA II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (357, 'YUYA II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (358, 'LIMON', '2', 2, '1', '0');
INSERT INTO caracteristicas VALUES (359, 'AMSTERDAN II', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (360, 'BRIGIT', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (361, 'LUIGIA', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (362, 'MOLLY', '2', 132, '1', '0');
INSERT INTO caracteristicas VALUES (363, 'SEDA', '2', 99, '1', '0');


--
-- Name: caracteristicas_idcaracteristica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('caracteristicas_idcaracteristica_seq', 363, true);


--
-- Name: categoria_idcategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('categoria_idcategoria_seq', 91, true);


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categorias VALUES (11, 'categoria prueba1', 'ssss', '0', 3);
INSERT INTO categorias VALUES (9, 'Polos deportivos niños', 'polos deportivos para niños', '0', 3);
INSERT INTO categorias VALUES (2, 'MUJERES', 'CATEGORÍA PARA ROPA DE MUJER', '1', NULL);
INSERT INTO categorias VALUES (1, 'HOMBRES', 'CATEGORÍA PARA ROPA DE HOMBRE', '1', NULL);
INSERT INTO categorias VALUES (3, 'NIÑOS', 'CATEGORÍA PARA ROPA DE NIÑOS', '1', NULL);
INSERT INTO categorias VALUES (12, 'NIÑAS', 'CATEGORÍA PARA ROPA DE NIÑAS', '1', NULL);
INSERT INTO categorias VALUES (4, 'ACCESORIOS', 'ACCESORIOS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (13, 'BILLETERAS', 'BILLETERAS PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (14, 'CANJUROS', 'CANJUROS PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (15, 'CORREAS', 'CORREAS PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (16, 'GORROS', 'GORROS PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (17, 'LENTES', 'LENTES PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (18, 'PACKS', 'PACKS PARA HOMBRE (BUMERÁN, CARTUCHERA, PORTA LLAVERO)', '1', 4);
INSERT INTO categorias VALUES (19, 'PORTA DOCUMENTO', 'PORTA DOCUMENTO PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (20, 'RELOJES', 'RELOJES PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (21, 'SOMBREROS', 'SOMBREROS PARA HOMBRE', '1', 4);
INSERT INTO categorias VALUES (22, 'DIGITAL', 'RELOJ DIGITAL PARA HOMBRE', '1', 20);
INSERT INTO categorias VALUES (23, 'ANALÓGICO', 'RELOJ ANALÓGICO PARA HOMBRE', '1', 20);
INSERT INTO categorias VALUES (24, 'DIGITAL/ANALÓGICO', 'RELOJ DIGITAL/ANALÓGICO PARA HOMBRE', '1', 20);
INSERT INTO categorias VALUES (25, 'PULSO', 'RELOJ DE PULSO PARA HOMBRE', '1', 20);
INSERT INTO categorias VALUES (26, 'CUERDA', 'RELOJ DE CUERDA PARA HOMBRE', '1', 20);
INSERT INTO categorias VALUES (27, 'REPUESTO DE RELOJES', 'REPUESTO DE RELOJES PARA HOMBRE', '1', 20);
INSERT INTO categorias VALUES (28, 'CORREAS', 'CORREAS DE RELOJES PARA HOMBRE', '1', 27);
INSERT INTO categorias VALUES (29, 'PORTARELOJES', 'PORTARELOJES', '1', 27);
INSERT INTO categorias VALUES (30, 'SPORT', 'LENTES SPORT PARA HOMBRE', '1', 17);
INSERT INTO categorias VALUES (31, 'VESTIR', 'LENTES DE VESTIR PARA HOMBRE', '1', 17);
INSERT INTO categorias VALUES (32, 'SPORT', 'CORREAS SPORT PARA HOMBRE', '1', 15);
INSERT INTO categorias VALUES (33, 'VESTIR', 'CORREAS DE VESTIR PARA HOMBRE', '1', 15);
INSERT INTO categorias VALUES (34, 'SUJETADOR DE LENTES(CROQUIS)', 'SUJETADOR DE LENTES PARA HOMBRE', '1', 17);
INSERT INTO categorias VALUES (35, 'CALZADO', 'CALZADO PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (36, 'ZAPATOS', 'ZAPATOS PARA HOMBRE', '1', 35);
INSERT INTO categorias VALUES (37, 'ZAPATILLAS', 'ZAPATILLAS PARA HOMBRE', '1', 35);
INSERT INTO categorias VALUES (38, 'SPORT', 'ZAPATOS SPORT PARA HOMBRE', '1', 36);
INSERT INTO categorias VALUES (39, 'VESTIR', 'ZAPATOS DE VESTIR PARA HOMBRE', '1', 36);
INSERT INTO categorias VALUES (40, 'BIVIDIS', 'BIVIDIS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (41, 'CASACAS', 'CASACAS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (42, 'POLERA', 'POLERA PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (43, 'SUECHER', 'SUECHER PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (44, 'SUECHER CLÁSICO', 'SUECHER PARA HOMBRE', '0', 43);
INSERT INTO categorias VALUES (45, 'SUECHER CON CIERRE', 'SUECHER CON CIERRE PARA HOMBRE', '1', 43);
INSERT INTO categorias VALUES (46, 'CHOMPA', 'CHOMPA PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (47, 'BLAZER', 'BLAZER PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (48, 'SACOS', 'SACOS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (49, 'CAFARENA', 'CAFARENA PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (50, 'ROPA DE BAÑO', 'ROPA DE BAÑO PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (51, 'CORTAS', 'ROPA DE BAÑO PARA HOMBRE CORTAS', '1', 50);
INSERT INTO categorias VALUES (52, 'LARGAS', 'ROPA DE BAÑO PARA HOMBRE LARGAS', '1', 50);
INSERT INTO categorias VALUES (53, 'SHORT', 'SHORT PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (54, 'CHALECOS', 'CHALECOS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (55, 'CAPRIS', 'CAPRIS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (56, 'BUZOS', 'BUZOS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (57, 'PANTALONES', 'PANTALONES PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (58, 'POLOS', 'POLOS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (59, 'BERMUDAS', 'BERMUDAS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (60, 'CHALINAS', 'CHALINAS PARA HOMBRE', '1', 1);
INSERT INTO categorias VALUES (61, 'LEGGINS', 'LEGGINS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (62, 'PANTALONES', 'PANTALONES PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (63, 'POLOS', 'POLOS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (64, 'BERMUDAS(TOREROS)', 'BERMUDAS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (65, 'BIVIDIS', 'BIVIDIS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (66, 'BLUSAS', 'BLUSAS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (67, 'CASACAS', 'CASACAS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (68, 'POLERAS', 'POLERAS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (69, 'SUECHER', 'SUECHER PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (70, 'SUECHER CLÁSICO', 'SUECHER CLÁSICO PARA MUJER', '1', 69);
INSERT INTO categorias VALUES (71, 'SUECHER CON CIERRE', 'SUECHER CON CIERRE PARA MUJER', '1', 69);
INSERT INTO categorias VALUES (72, 'CHOMPA', 'CHOMPA PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (73, 'BLAZER', 'BLAZER PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (74, 'SACOS', 'SACOS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (75, 'CAFARENA', 'CAFARENA PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (76, 'BODY', 'BODY PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (77, 'TOP', 'TOP PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (78, 'ROPA DE BAÑO', 'ROPA DE BAÑO PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (79, 'BIQUINI', 'BIQUINI PARA MUJER', '1', 78);
INSERT INTO categorias VALUES (80, 'TRIQUINI', 'TRIQUINI PARA MUJER', '1', 78);
INSERT INTO categorias VALUES (81, 'TRAJES DE BAÑO', 'TRAJES DE BAÑO PARA MUJER', '1', 78);
INSERT INTO categorias VALUES (82, 'TANGA', 'TANGA PARA MUJER', '1', 81);
INSERT INTO categorias VALUES (83, 'ENTERIZOS', 'ENTERIZOS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (84, 'JUMPER', 'JUMPER PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (85, 'SHORT', 'SHORT PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (86, 'VESTIDOS', 'VESTIDOS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (87, 'CHALECOS', 'CHALECOS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (88, 'FALDAS', 'FALDAS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (89, 'CAPRIS', 'CAPRIS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (90, 'PANTALONETAS', 'PANTALONETAS PARA MUJER', '1', 2);
INSERT INTO categorias VALUES (91, 'BUZOS', 'BUZOS PARA MUJER', '1', 2);


--
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: compras_comp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('compras_comp_id_seq', 1, false);


--
-- Data for Name: compras_det; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: compras_det_comp_det_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('compras_det_comp_det_id_seq', 1, false);


--
-- Data for Name: iconos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO iconos VALUES (1, 'fa fa-shopping-cart');
INSERT INTO iconos VALUES (2, 'fa fa-home');
INSERT INTO iconos VALUES (3, 'fa fa-line-chart');
INSERT INTO iconos VALUES (4, 'fa fa-calculator');
INSERT INTO iconos VALUES (5, 'fa fa-cog');
INSERT INTO iconos VALUES (6, 'fa fa-edit');


--
-- Name: iconos_id_icono_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('iconos_id_icono_seq', 6, true);


--
-- Data for Name: igv; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO igv VALUES (1, 0.179999999999999993, '2017-02-01', NULL);


--
-- Name: igv_id_igv_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('igv_id_igv_seq', 2, true);


--
-- Data for Name: linea; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: linea_idlinea_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('linea_idlinea_seq', 1, false);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menu VALUES (8, 'Comprar', '#', 1, NULL, NULL);
INSERT INTO menu VALUES (9, 'Productos', '#', 2, NULL, NULL);
INSERT INTO menu VALUES (10, 'Movimientos', '#', 2, NULL, NULL);
INSERT INTO menu VALUES (11, 'Vender', '#', 3, NULL, NULL);
INSERT INTO menu VALUES (12, 'Proformar', '#', 3, NULL, NULL);
INSERT INTO menu VALUES (13, 'Guia de Remision', '#', 3, NULL, NULL);
INSERT INTO menu VALUES (14, 'Anular Venta', '#', 3, NULL, NULL);
INSERT INTO menu VALUES (15, 'Control de Caja', '#', 4, NULL, NULL);
INSERT INTO menu VALUES (16, 'Pagos', '#', 4, NULL, NULL);
INSERT INTO menu VALUES (17, 'Letras de Venta', '#', 16, NULL, NULL);
INSERT INTO menu VALUES (18, 'Letras de Compra', '#', 16, NULL, NULL);
INSERT INTO menu VALUES (20, 'Juridicos', '#', 19, NULL, NULL);
INSERT INTO menu VALUES (21, 'Naturales', '#', 20, NULL, NULL);
INSERT INTO menu VALUES (33, 'Clientes', '#', 6, NULL, NULL);
INSERT INTO menu VALUES (34, 'Ventas por Vendedor', '#', 6, NULL, NULL);
INSERT INTO menu VALUES (35, 'Montos por Cobrar', '#', 6, NULL, NULL);
INSERT INTO menu VALUES (36, 'Montos por Pagar', '#', 6, NULL, NULL);
INSERT INTO menu VALUES (37, 'Productos por Sucursal', '#', 6, NULL, NULL);
INSERT INTO menu VALUES (7, 'Pedido', 'index.php?page=compras&accion=panelpedido', 1, NULL, NULL);
INSERT INTO menu VALUES (2, 'Almacen', '#', NULL, 2, 2);
INSERT INTO menu VALUES (3, 'Venta', '#', NULL, 3, 3);
INSERT INTO menu VALUES (4, 'Caja', '#', NULL, 4, 4);
INSERT INTO menu VALUES (5, 'Mantenimientos', '#', NULL, 5, 5);
INSERT INTO menu VALUES (6, 'Reportes', '#', NULL, 6, 6);
INSERT INTO menu VALUES (19, 'Cliente', 'index.php?page=mantenimientos&accion=panelcliente', 5, NULL, 5);
INSERT INTO menu VALUES (22, 'Proveedores', 'index.php?page=mantenimientos&accion=panelproveedor', 5, NULL, 4);
INSERT INTO menu VALUES (23, 'Sucursales', 'index.php?page=mantenimientos&accion=panelsucursal', 5, NULL, 1);
INSERT INTO menu VALUES (24, 'Empleados', 'index.php?page=mantenimientos&accion=panelempleados', 5, NULL, 3);
INSERT INTO menu VALUES (26, 'Area de Trabajo', 'index.php?page=mantenimientos&accion=panelarea', 5, NULL, 2);
INSERT INTO menu VALUES (27, 'Unidad de Medida', 'index.php?page=mantenimientos&accion=panelunidadmedida', 5, NULL, 8);
INSERT INTO menu VALUES (29, 'Categoria de Producto', 'index.php?page=categorias&accion=panelcategorias', 5, NULL, 6);
INSERT INTO menu VALUES (30, 'Producto', 'index.php?page=productos&accion=panelproductos', 5, NULL, 9);
INSERT INTO menu VALUES (31, 'Actualizar IGV', 'index.php?page=mantenimientos&accion=paneligv', 5, NULL, 11);
INSERT INTO menu VALUES (32, 'Numeracion de Documentos', '#', 5, NULL, 10);
INSERT INTO menu VALUES (38, 'Caracteristicas de productos', 'index.php?page=caracteristicas&accion=panelcaracteristicas', 5, NULL, 7);
INSERT INTO menu VALUES (1, 'Compra', '#', NULL, 1, 1);


--
-- Name: menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_id_menu_seq', 38, true);


--
-- Data for Name: menu_perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO menu_perfil VALUES (1, 1, 1);
INSERT INTO menu_perfil VALUES (2, 7, 1);
INSERT INTO menu_perfil VALUES (3, 8, 1);
INSERT INTO menu_perfil VALUES (4, 2, 1);
INSERT INTO menu_perfil VALUES (5, 9, 1);
INSERT INTO menu_perfil VALUES (6, 10, 1);
INSERT INTO menu_perfil VALUES (7, 3, 1);
INSERT INTO menu_perfil VALUES (8, 11, 1);
INSERT INTO menu_perfil VALUES (9, 12, 1);
INSERT INTO menu_perfil VALUES (10, 13, 1);
INSERT INTO menu_perfil VALUES (11, 14, 1);
INSERT INTO menu_perfil VALUES (12, 4, 1);
INSERT INTO menu_perfil VALUES (13, 15, 1);
INSERT INTO menu_perfil VALUES (14, 16, 1);
INSERT INTO menu_perfil VALUES (15, 17, 1);
INSERT INTO menu_perfil VALUES (16, 18, 1);
INSERT INTO menu_perfil VALUES (17, 5, 1);
INSERT INTO menu_perfil VALUES (18, 19, 1);
INSERT INTO menu_perfil VALUES (19, 20, 1);
INSERT INTO menu_perfil VALUES (20, 21, 1);
INSERT INTO menu_perfil VALUES (21, 22, 1);
INSERT INTO menu_perfil VALUES (22, 23, 1);
INSERT INTO menu_perfil VALUES (23, 24, 1);
INSERT INTO menu_perfil VALUES (24, 25, 1);
INSERT INTO menu_perfil VALUES (25, 26, 1);
INSERT INTO menu_perfil VALUES (26, 27, 1);
INSERT INTO menu_perfil VALUES (27, 28, 1);
INSERT INTO menu_perfil VALUES (28, 29, 1);
INSERT INTO menu_perfil VALUES (29, 30, 1);
INSERT INTO menu_perfil VALUES (30, 31, 1);
INSERT INTO menu_perfil VALUES (31, 32, 1);
INSERT INTO menu_perfil VALUES (32, 6, 1);
INSERT INTO menu_perfil VALUES (33, 33, 1);
INSERT INTO menu_perfil VALUES (34, 34, 1);
INSERT INTO menu_perfil VALUES (35, 35, 1);
INSERT INTO menu_perfil VALUES (36, 36, 1);
INSERT INTO menu_perfil VALUES (37, 37, 1);
INSERT INTO menu_perfil VALUES (38, 38, 1);


--
-- Name: menu_perfil_id_menu_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menu_perfil_id_menu_perfil_seq', 38, true);


--
-- Data for Name: pedido_compra_det; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: pedido_compra_det_ped_det_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedido_compra_det_ped_det_id_seq', 1, false);


--
-- Data for Name: pedido_compras; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: pedido_compras_pec_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pedido_compras_pec_id_seq', 1, false);


--
-- Data for Name: perfil; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO perfil VALUES (1, 'Administrador');
INSERT INTO perfil VALUES (2, 'Supervisor');
INSERT INTO perfil VALUES (3, 'Operario');


--
-- Name: perfil_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('perfil_id_perfil_seq', 3, true);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO persona VALUES (6, NULL, '', '', '', '1', NULL, 'PROL. HUANUCO 1699 INT. 304', '957816325', 'dsoft@gmail.com', '074224578', '/JEANSROY', '2', '1038475637', 'JEANS ROY - JOSE JAIME ZARPAN YUPTON', '0', NULL, '', '1', NULL, 12501419, '1', 6, '2017-12-09 04:40:55', 10, 1);
INSERT INTO persona VALUES (7, NULL, '', '', '', '1', NULL, 'CALLE CHINCA ALTA MANZANA F LOTE 8 PARQUE INDUSTRIAL SAN PEDRITO II', '987654321', 'RITZY@GMAIL.COM', '074895623', '/RITZY', '2', '20101042384', 'CONFECCIONES RITZY S.A.', '0', NULL, '', '1', NULL, 127114130, '1', 6, '2017-12-09 04:48:05', 11, 2);
INSERT INTO persona VALUES (9, NULL, '', '', '', '1', NULL, 'CALLE CAMINO REAL 1801 B-26 PARQUE INDUSTRIAL SAN PEDRITO 1', '987654321', 'ADMINISTRACION@GOCCOSJEANS.COM', '(51-1)252-8006', '/GOCCOS', '2', '20515433431', 'CONFECCIONES S.A.C.', '0', NULL, '', '1', NULL, 127114130, '1', 6, '2017-12-09 04:53:42', 69, 3);
INSERT INTO persona VALUES (10, NULL, '', '', '', '1', NULL, 'CA. CARLOS FERMIN FITZCARRALD MZA. M LOTE 01 COOP. EL OLIVAR', '654321987', 'FYMCOMPANY@GMAIL.COM', '123456', 'CORREO.COM', '2', '20602541135', 'F&M COMPANY S.A.C.', '0', NULL, '', '1', NULL, 128314142, '1', 6, '2017-12-09 05:02:07', 70, 4);
INSERT INTO persona VALUES (11, NULL, '', '', '', '1', NULL, 'LAUREANO MARTÍNEZ N° 200', '622-1156', 'LAFEL@GMAIL.COM', '622-1155', '/LAFEL', '2', '20601295262', 'LAURA FELIX S.A.C.', '0', NULL, '', '1', NULL, 126314122, '1', 6, '2017-12-09 05:04:43', 71, 5);
INSERT INTO persona VALUES (12, NULL, '', '', '', '1', NULL, 'AV. JAVIER PRADO ESTE 4200', '', 'ZARA@GMAIL.COM', '4341255', '/ZARA', '2', '20544353714', 'IBEROTEX S.A.C.', '0', NULL, '', '1', NULL, 127114130, '1', 6, '2017-12-09 05:06:40', 72, 6);
INSERT INTO persona VALUES (13, NULL, '', '', '', '1', NULL, 'CAL. MARISCAL AGUTÍN GAMARRA NRO. 326', '326-51-05', 'SODA@GMAIL.COM', '326-51-11', '/SODA', '2', '20546183107', 'CONSORCIO ALTA MODA S.R.L.', '0', NULL, '', '1', NULL, 127914138, '1', 6, '2017-12-09 05:09:23', 73, 7);
INSERT INTO persona VALUES (14, NULL, '', '', '', '1', NULL, '', '', '', '', '', '2', '10203040', 'INDUSTRIAS DE LA MODA', '0', NULL, '', '1', NULL, 12421411, '1', 3, '2017-12-09 17:44:11', 141, 8);
INSERT INTO persona VALUES (15, NULL, '', '', '', '1', NULL, '', '', '', '', '', '2', '11111111111', 'GAMARRA', '0', NULL, '', '1', NULL, 12421411, '1', 3, '2017-12-09 18:23:40', 156, 9);
INSERT INTO persona VALUES (16, NULL, '', '', '', '1', NULL, '', '', '', '', '', '2', '22222222222', 'OXUS JEANS', '0', NULL, '', '1', NULL, 12421411, '1', 3, '2017-12-09 19:09:53', 172, 10);
INSERT INTO persona VALUES (17, NULL, '', '', '', '1', NULL, '', '', '', '', '', '2', '33333333333', 'FIORUCCI', '0', NULL, '', '1', NULL, 12421411, '1', 3, '2017-12-09 19:14:50', 174, 11);
INSERT INTO persona VALUES (3, '87654321', 'victor hugo', 'gonzales', 'more', '1', '1989-04-12', 'miraflores #345', '987654321', 'victorhugo@hotmail.com', '22345', 'www.facebook.com/victorhugo', '1', '', '', '1', 1, '87654321', '1', 1, 14381542, '0', 3, '2017-12-09 17:21:35', NULL, 12);
INSERT INTO persona VALUES (8, NULL, '', '', '', '1', NULL, '2DA. ETAPA MZ. F - LOTE 8 PARQUE INDUSTRIAL SAN PEDRO II', '123456789', 'SCOMBRO@gmail.com', '01255878', '/SCOMBRO', '2', '20512572350', 'TEXTILES MISSONI S.A.C.', '0', NULL, '', '1', NULL, 127114130, '1', 3, '2018-01-11 00:21:58', 7, 13);
INSERT INTO persona VALUES (19, '88888888', 'EMPLEADO2', 'EMPLEADO2', 'EMPLEADO2', '2', '1995-02-12', 'CALLE', '987654321', 'CORREO', '123456', '', '1', '', '', '1', 2, '88888888', '1', NULL, 404455, '0', 3, '2018-02-27 13:14:25', NULL, 14);
INSERT INTO persona VALUES (20, '88888889', 'EMPLEADO1', 'EMPLEADO1', 'EMPLEADO1', '1', '1995-02-12', 'DIRECCION', '987654321', 'correo', '123456', '', '1', '', '', '1', 2, '88888889', '1', NULL, 404455, '0', 3, '2018-02-27 13:14:58', NULL, 15);
INSERT INTO persona VALUES (18, NULL, '', '', '', '1', NULL, '', '', '', '', '', '2', '44444444444', 'NUNURA', '0', NULL, '', '1', NULL, 12421411, '1', 3, '2018-02-27 13:16:27', 178, 16);


--
-- Name: persona_id_per_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_id_per_seq', 20, true);


--
-- Name: persona_per_suc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('persona_per_suc_id_seq', 16, true);


--
-- Data for Name: producto_caracteristica; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO producto_caracteristica VALUES (9, 11, 3);
INSERT INTO producto_caracteristica VALUES (18, 13, 3);
INSERT INTO producto_caracteristica VALUES (19, 14, 3);
INSERT INTO producto_caracteristica VALUES (20, 15, 3);
INSERT INTO producto_caracteristica VALUES (21, 16, 3);
INSERT INTO producto_caracteristica VALUES (22, 17, 3);
INSERT INTO producto_caracteristica VALUES (27, 12, 141);
INSERT INTO producto_caracteristica VALUES (28, 12, 13);
INSERT INTO producto_caracteristica VALUES (29, 12, 29);
INSERT INTO producto_caracteristica VALUES (30, 12, 142);
INSERT INTO producto_caracteristica VALUES (31, 12, 78);
INSERT INTO producto_caracteristica VALUES (32, 12, 81);
INSERT INTO producto_caracteristica VALUES (33, 12, 113);
INSERT INTO producto_caracteristica VALUES (40, 19, 141);
INSERT INTO producto_caracteristica VALUES (41, 19, 3);
INSERT INTO producto_caracteristica VALUES (42, 19, 54);
INSERT INTO producto_caracteristica VALUES (43, 19, 77);
INSERT INTO producto_caracteristica VALUES (44, 19, 113);
INSERT INTO producto_caracteristica VALUES (45, 19, 146);
INSERT INTO producto_caracteristica VALUES (46, 19, 148);
INSERT INTO producto_caracteristica VALUES (53, 20, 141);
INSERT INTO producto_caracteristica VALUES (54, 20, 13);
INSERT INTO producto_caracteristica VALUES (55, 20, 20);
INSERT INTO producto_caracteristica VALUES (56, 20, 78);
INSERT INTO producto_caracteristica VALUES (57, 20, 115);
INSERT INTO producto_caracteristica VALUES (58, 20, 149);
INSERT INTO producto_caracteristica VALUES (59, 20, 150);
INSERT INTO producto_caracteristica VALUES (60, 21, 141);
INSERT INTO producto_caracteristica VALUES (61, 21, 22);
INSERT INTO producto_caracteristica VALUES (62, 21, 77);
INSERT INTO producto_caracteristica VALUES (63, 21, 146);
INSERT INTO producto_caracteristica VALUES (64, 21, 113);
INSERT INTO producto_caracteristica VALUES (65, 21, 5);
INSERT INTO producto_caracteristica VALUES (66, 21, 148);
INSERT INTO producto_caracteristica VALUES (67, 22, 141);
INSERT INTO producto_caracteristica VALUES (68, 22, 35);
INSERT INTO producto_caracteristica VALUES (69, 22, 78);
INSERT INTO producto_caracteristica VALUES (70, 22, 152);
INSERT INTO producto_caracteristica VALUES (71, 22, 113);
INSERT INTO producto_caracteristica VALUES (72, 22, 153);
INSERT INTO producto_caracteristica VALUES (73, 22, 6);
INSERT INTO producto_caracteristica VALUES (80, 23, 141);
INSERT INTO producto_caracteristica VALUES (81, 23, 5);
INSERT INTO producto_caracteristica VALUES (82, 23, 24);
INSERT INTO producto_caracteristica VALUES (83, 23, 75);
INSERT INTO producto_caracteristica VALUES (84, 23, 83);
INSERT INTO producto_caracteristica VALUES (85, 23, 154);
INSERT INTO producto_caracteristica VALUES (86, 23, 155);
INSERT INTO producto_caracteristica VALUES (92, 24, 9);
INSERT INTO producto_caracteristica VALUES (93, 24, 76);
INSERT INTO producto_caracteristica VALUES (94, 24, 84);
INSERT INTO producto_caracteristica VALUES (95, 24, 107);
INSERT INTO producto_caracteristica VALUES (96, 24, 156);
INSERT INTO producto_caracteristica VALUES (97, 24, 157);
INSERT INTO producto_caracteristica VALUES (98, 25, 156);
INSERT INTO producto_caracteristica VALUES (99, 25, 22);
INSERT INTO producto_caracteristica VALUES (100, 25, 76);
INSERT INTO producto_caracteristica VALUES (101, 25, 84);
INSERT INTO producto_caracteristica VALUES (102, 25, 107);
INSERT INTO producto_caracteristica VALUES (103, 25, 157);
INSERT INTO producto_caracteristica VALUES (104, 26, 156);
INSERT INTO producto_caracteristica VALUES (105, 26, 158);
INSERT INTO producto_caracteristica VALUES (106, 26, 76);
INSERT INTO producto_caracteristica VALUES (107, 26, 84);
INSERT INTO producto_caracteristica VALUES (108, 26, 107);
INSERT INTO producto_caracteristica VALUES (109, 26, 157);
INSERT INTO producto_caracteristica VALUES (114, 27, 5);
INSERT INTO producto_caracteristica VALUES (115, 27, 22);
INSERT INTO producto_caracteristica VALUES (116, 27, 70);
INSERT INTO producto_caracteristica VALUES (117, 27, 78);
INSERT INTO producto_caracteristica VALUES (118, 27, 160);
INSERT INTO producto_caracteristica VALUES (119, 27, 161);
INSERT INTO producto_caracteristica VALUES (120, 27, 162);
INSERT INTO producto_caracteristica VALUES (121, 28, 70);
INSERT INTO producto_caracteristica VALUES (122, 28, 12);
INSERT INTO producto_caracteristica VALUES (123, 28, 78);
INSERT INTO producto_caracteristica VALUES (124, 28, 149);
INSERT INTO producto_caracteristica VALUES (125, 28, 164);
INSERT INTO producto_caracteristica VALUES (126, 28, 163);
INSERT INTO producto_caracteristica VALUES (127, 28, 5);
INSERT INTO producto_caracteristica VALUES (129, 29, 7);
INSERT INTO producto_caracteristica VALUES (130, 29, 77);
INSERT INTO producto_caracteristica VALUES (131, 29, 166);
INSERT INTO producto_caracteristica VALUES (132, 29, 149);
INSERT INTO producto_caracteristica VALUES (133, 29, 113);
INSERT INTO producto_caracteristica VALUES (134, 29, 165);
INSERT INTO producto_caracteristica VALUES (135, 29, 5);
INSERT INTO producto_caracteristica VALUES (136, 30, 7);
INSERT INTO producto_caracteristica VALUES (137, 30, 167);
INSERT INTO producto_caracteristica VALUES (138, 30, 77);
INSERT INTO producto_caracteristica VALUES (139, 30, 149);
INSERT INTO producto_caracteristica VALUES (140, 30, 113);
INSERT INTO producto_caracteristica VALUES (141, 30, 165);
INSERT INTO producto_caracteristica VALUES (142, 30, 5);
INSERT INTO producto_caracteristica VALUES (143, 31, 7);
INSERT INTO producto_caracteristica VALUES (144, 31, 169);
INSERT INTO producto_caracteristica VALUES (145, 31, 78);
INSERT INTO producto_caracteristica VALUES (146, 31, 149);
INSERT INTO producto_caracteristica VALUES (147, 31, 113);
INSERT INTO producto_caracteristica VALUES (148, 31, 168);
INSERT INTO producto_caracteristica VALUES (149, 31, 5);
INSERT INTO producto_caracteristica VALUES (150, 32, 7);
INSERT INTO producto_caracteristica VALUES (151, 32, 170);
INSERT INTO producto_caracteristica VALUES (152, 32, 78);
INSERT INTO producto_caracteristica VALUES (153, 32, 149);
INSERT INTO producto_caracteristica VALUES (154, 32, 113);
INSERT INTO producto_caracteristica VALUES (155, 32, 168);
INSERT INTO producto_caracteristica VALUES (156, 32, 5);
INSERT INTO producto_caracteristica VALUES (157, 33, 7);
INSERT INTO producto_caracteristica VALUES (158, 33, 33);
INSERT INTO producto_caracteristica VALUES (159, 33, 78);
INSERT INTO producto_caracteristica VALUES (160, 33, 146);
INSERT INTO producto_caracteristica VALUES (161, 33, 171);
INSERT INTO producto_caracteristica VALUES (162, 33, 6);
INSERT INTO producto_caracteristica VALUES (163, 34, 172);
INSERT INTO producto_caracteristica VALUES (164, 34, 55);
INSERT INTO producto_caracteristica VALUES (165, 34, 77);
INSERT INTO producto_caracteristica VALUES (166, 34, 146);
INSERT INTO producto_caracteristica VALUES (167, 34, 113);
INSERT INTO producto_caracteristica VALUES (168, 34, 173);
INSERT INTO producto_caracteristica VALUES (169, 34, 6);
INSERT INTO producto_caracteristica VALUES (170, 35, 174);
INSERT INTO producto_caracteristica VALUES (171, 35, 176);
INSERT INTO producto_caracteristica VALUES (172, 35, 77);
INSERT INTO producto_caracteristica VALUES (173, 35, 152);
INSERT INTO producto_caracteristica VALUES (174, 35, 113);
INSERT INTO producto_caracteristica VALUES (175, 35, 175);
INSERT INTO producto_caracteristica VALUES (176, 35, 6);
INSERT INTO producto_caracteristica VALUES (183, 36, 57);
INSERT INTO producto_caracteristica VALUES (184, 36, 77);
INSERT INTO producto_caracteristica VALUES (185, 36, 113);
INSERT INTO producto_caracteristica VALUES (186, 36, 146);
INSERT INTO producto_caracteristica VALUES (187, 36, 177);
INSERT INTO producto_caracteristica VALUES (188, 36, 178);
INSERT INTO producto_caracteristica VALUES (189, 36, 179);
INSERT INTO producto_caracteristica VALUES (190, 37, 73);
INSERT INTO producto_caracteristica VALUES (191, 37, 22);
INSERT INTO producto_caracteristica VALUES (192, 37, 76);
INSERT INTO producto_caracteristica VALUES (193, 37, 146);
INSERT INTO producto_caracteristica VALUES (194, 37, 113);
INSERT INTO producto_caracteristica VALUES (195, 37, 5);
INSERT INTO producto_caracteristica VALUES (196, 38, 73);
INSERT INTO producto_caracteristica VALUES (197, 38, 66);
INSERT INTO producto_caracteristica VALUES (198, 38, 76);
INSERT INTO producto_caracteristica VALUES (199, 38, 146);
INSERT INTO producto_caracteristica VALUES (200, 38, 113);
INSERT INTO producto_caracteristica VALUES (201, 38, 180);
INSERT INTO producto_caracteristica VALUES (202, 38, 5);
INSERT INTO producto_caracteristica VALUES (203, 39, 73);
INSERT INTO producto_caracteristica VALUES (204, 39, 28);
INSERT INTO producto_caracteristica VALUES (205, 39, 76);
INSERT INTO producto_caracteristica VALUES (206, 39, 146);
INSERT INTO producto_caracteristica VALUES (207, 39, 182);
INSERT INTO producto_caracteristica VALUES (208, 39, 181);
INSERT INTO producto_caracteristica VALUES (209, 39, 6);
INSERT INTO producto_caracteristica VALUES (210, 40, 73);
INSERT INTO producto_caracteristica VALUES (211, 40, 183);
INSERT INTO producto_caracteristica VALUES (212, 40, 76);
INSERT INTO producto_caracteristica VALUES (213, 40, 146);
INSERT INTO producto_caracteristica VALUES (214, 40, 182);
INSERT INTO producto_caracteristica VALUES (215, 40, 181);
INSERT INTO producto_caracteristica VALUES (216, 40, 13);
INSERT INTO producto_caracteristica VALUES (217, 41, 73);
INSERT INTO producto_caracteristica VALUES (218, 41, 184);
INSERT INTO producto_caracteristica VALUES (219, 41, 76);
INSERT INTO producto_caracteristica VALUES (220, 41, 146);
INSERT INTO producto_caracteristica VALUES (221, 41, 182);
INSERT INTO producto_caracteristica VALUES (222, 41, 181);
INSERT INTO producto_caracteristica VALUES (223, 41, 6);
INSERT INTO producto_caracteristica VALUES (224, 42, 73);
INSERT INTO producto_caracteristica VALUES (225, 42, 20);
INSERT INTO producto_caracteristica VALUES (226, 42, 76);
INSERT INTO producto_caracteristica VALUES (227, 42, 149);
INSERT INTO producto_caracteristica VALUES (228, 42, 113);
INSERT INTO producto_caracteristica VALUES (229, 42, 185);
INSERT INTO producto_caracteristica VALUES (230, 42, 5);
INSERT INTO producto_caracteristica VALUES (231, 43, 73);
INSERT INTO producto_caracteristica VALUES (232, 43, 24);
INSERT INTO producto_caracteristica VALUES (233, 43, 78);
INSERT INTO producto_caracteristica VALUES (234, 43, 110);
INSERT INTO producto_caracteristica VALUES (235, 43, 5);
INSERT INTO producto_caracteristica VALUES (236, 43, 186);
INSERT INTO producto_caracteristica VALUES (237, 43, 187);
INSERT INTO producto_caracteristica VALUES (238, 44, 73);
INSERT INTO producto_caracteristica VALUES (239, 44, 21);
INSERT INTO producto_caracteristica VALUES (240, 44, 78);
INSERT INTO producto_caracteristica VALUES (241, 44, 146);
INSERT INTO producto_caracteristica VALUES (242, 44, 102);
INSERT INTO producto_caracteristica VALUES (243, 44, 5);
INSERT INTO producto_caracteristica VALUES (244, 45, 73);
INSERT INTO producto_caracteristica VALUES (245, 45, 52);
INSERT INTO producto_caracteristica VALUES (246, 45, 76);
INSERT INTO producto_caracteristica VALUES (247, 45, 149);
INSERT INTO producto_caracteristica VALUES (248, 45, 113);
INSERT INTO producto_caracteristica VALUES (249, 45, 188);
INSERT INTO producto_caracteristica VALUES (250, 45, 5);
INSERT INTO producto_caracteristica VALUES (251, 46, 73);
INSERT INTO producto_caracteristica VALUES (252, 46, 25);
INSERT INTO producto_caracteristica VALUES (253, 46, 76);
INSERT INTO producto_caracteristica VALUES (254, 46, 149);
INSERT INTO producto_caracteristica VALUES (255, 46, 113);
INSERT INTO producto_caracteristica VALUES (256, 46, 188);
INSERT INTO producto_caracteristica VALUES (257, 46, 5);
INSERT INTO producto_caracteristica VALUES (258, 47, 73);
INSERT INTO producto_caracteristica VALUES (259, 47, 21);
INSERT INTO producto_caracteristica VALUES (260, 47, 76);
INSERT INTO producto_caracteristica VALUES (261, 47, 190);
INSERT INTO producto_caracteristica VALUES (262, 47, 113);
INSERT INTO producto_caracteristica VALUES (263, 47, 189);
INSERT INTO producto_caracteristica VALUES (264, 47, 5);
INSERT INTO producto_caracteristica VALUES (265, 48, 73);
INSERT INTO producto_caracteristica VALUES (266, 48, 42);
INSERT INTO producto_caracteristica VALUES (267, 48, 78);
INSERT INTO producto_caracteristica VALUES (268, 48, 146);
INSERT INTO producto_caracteristica VALUES (269, 48, 191);
INSERT INTO producto_caracteristica VALUES (270, 48, 13);
INSERT INTO producto_caracteristica VALUES (271, 48, 113);
INSERT INTO producto_caracteristica VALUES (272, 49, 73);
INSERT INTO producto_caracteristica VALUES (273, 49, 33);
INSERT INTO producto_caracteristica VALUES (274, 49, 78);
INSERT INTO producto_caracteristica VALUES (275, 49, 146);
INSERT INTO producto_caracteristica VALUES (276, 49, 115);
INSERT INTO producto_caracteristica VALUES (277, 49, 192);
INSERT INTO producto_caracteristica VALUES (278, 49, 13);
INSERT INTO producto_caracteristica VALUES (279, 50, 73);
INSERT INTO producto_caracteristica VALUES (280, 50, 9);
INSERT INTO producto_caracteristica VALUES (281, 50, 75);
INSERT INTO producto_caracteristica VALUES (282, 50, 83);
INSERT INTO producto_caracteristica VALUES (283, 50, 113);
INSERT INTO producto_caracteristica VALUES (284, 50, 193);
INSERT INTO producto_caracteristica VALUES (285, 50, 5);
INSERT INTO producto_caracteristica VALUES (286, 51, 73);
INSERT INTO producto_caracteristica VALUES (287, 51, 28);
INSERT INTO producto_caracteristica VALUES (288, 51, 78);
INSERT INTO producto_caracteristica VALUES (289, 51, 146);
INSERT INTO producto_caracteristica VALUES (290, 51, 115);
INSERT INTO producto_caracteristica VALUES (291, 51, 192);
INSERT INTO producto_caracteristica VALUES (292, 51, 13);
INSERT INTO producto_caracteristica VALUES (293, 52, 73);
INSERT INTO producto_caracteristica VALUES (294, 52, 28);
INSERT INTO producto_caracteristica VALUES (295, 52, 75);
INSERT INTO producto_caracteristica VALUES (296, 52, 83);
INSERT INTO producto_caracteristica VALUES (297, 52, 115);
INSERT INTO producto_caracteristica VALUES (298, 52, 194);
INSERT INTO producto_caracteristica VALUES (299, 52, 13);
INSERT INTO producto_caracteristica VALUES (300, 53, 73);
INSERT INTO producto_caracteristica VALUES (301, 53, 21);
INSERT INTO producto_caracteristica VALUES (302, 53, 75);
INSERT INTO producto_caracteristica VALUES (303, 53, 83);
INSERT INTO producto_caracteristica VALUES (304, 53, 115);
INSERT INTO producto_caracteristica VALUES (305, 53, 194);
INSERT INTO producto_caracteristica VALUES (306, 53, 5);
INSERT INTO producto_caracteristica VALUES (307, 54, 73);
INSERT INTO producto_caracteristica VALUES (308, 54, 21);
INSERT INTO producto_caracteristica VALUES (309, 54, 76);
INSERT INTO producto_caracteristica VALUES (310, 54, 196);
INSERT INTO producto_caracteristica VALUES (311, 54, 182);
INSERT INTO producto_caracteristica VALUES (312, 54, 195);
INSERT INTO producto_caracteristica VALUES (313, 54, 5);
INSERT INTO producto_caracteristica VALUES (314, 55, 73);
INSERT INTO producto_caracteristica VALUES (315, 55, 33);
INSERT INTO producto_caracteristica VALUES (316, 55, 76);
INSERT INTO producto_caracteristica VALUES (317, 55, 196);
INSERT INTO producto_caracteristica VALUES (318, 55, 182);
INSERT INTO producto_caracteristica VALUES (319, 55, 195);
INSERT INTO producto_caracteristica VALUES (320, 55, 5);
INSERT INTO producto_caracteristica VALUES (321, 56, 73);
INSERT INTO producto_caracteristica VALUES (322, 56, 12);
INSERT INTO producto_caracteristica VALUES (323, 56, 75);
INSERT INTO producto_caracteristica VALUES (324, 56, 83);
INSERT INTO producto_caracteristica VALUES (325, 56, 113);
INSERT INTO producto_caracteristica VALUES (326, 56, 193);
INSERT INTO producto_caracteristica VALUES (327, 56, 5);
INSERT INTO producto_caracteristica VALUES (335, 58, 73);
INSERT INTO producto_caracteristica VALUES (336, 58, 21);
INSERT INTO producto_caracteristica VALUES (337, 58, 76);
INSERT INTO producto_caracteristica VALUES (338, 58, 146);
INSERT INTO producto_caracteristica VALUES (339, 58, 182);
INSERT INTO producto_caracteristica VALUES (340, 58, 197);
INSERT INTO producto_caracteristica VALUES (341, 58, 5);
INSERT INTO producto_caracteristica VALUES (342, 57, 13);
INSERT INTO producto_caracteristica VALUES (343, 57, 44);
INSERT INTO producto_caracteristica VALUES (344, 57, 73);
INSERT INTO producto_caracteristica VALUES (345, 57, 76);
INSERT INTO producto_caracteristica VALUES (346, 57, 115);
INSERT INTO producto_caracteristica VALUES (347, 57, 199);
INSERT INTO producto_caracteristica VALUES (348, 57, 190);
INSERT INTO producto_caracteristica VALUES (349, 59, 73);
INSERT INTO producto_caracteristica VALUES (350, 59, 22);
INSERT INTO producto_caracteristica VALUES (351, 59, 76);
INSERT INTO producto_caracteristica VALUES (352, 59, 146);
INSERT INTO producto_caracteristica VALUES (353, 59, 182);
INSERT INTO producto_caracteristica VALUES (354, 59, 197);
INSERT INTO producto_caracteristica VALUES (355, 59, 13);
INSERT INTO producto_caracteristica VALUES (356, 60, 73);
INSERT INTO producto_caracteristica VALUES (357, 60, 21);
INSERT INTO producto_caracteristica VALUES (358, 60, 76);
INSERT INTO producto_caracteristica VALUES (359, 60, 190);
INSERT INTO producto_caracteristica VALUES (360, 60, 113);
INSERT INTO producto_caracteristica VALUES (361, 60, 189);
INSERT INTO producto_caracteristica VALUES (362, 60, 6);
INSERT INTO producto_caracteristica VALUES (363, 61, 73);
INSERT INTO producto_caracteristica VALUES (364, 61, 32);
INSERT INTO producto_caracteristica VALUES (365, 61, 78);
INSERT INTO producto_caracteristica VALUES (366, 61, 115);
INSERT INTO producto_caracteristica VALUES (367, 61, 198);
INSERT INTO producto_caracteristica VALUES (368, 61, 6);
INSERT INTO producto_caracteristica VALUES (369, 61, 149);
INSERT INTO producto_caracteristica VALUES (370, 62, 73);
INSERT INTO producto_caracteristica VALUES (371, 62, 31);
INSERT INTO producto_caracteristica VALUES (372, 62, 78);
INSERT INTO producto_caracteristica VALUES (373, 62, 149);
INSERT INTO producto_caracteristica VALUES (374, 62, 115);
INSERT INTO producto_caracteristica VALUES (375, 62, 198);
INSERT INTO producto_caracteristica VALUES (376, 62, 6);
INSERT INTO producto_caracteristica VALUES (377, 63, 73);
INSERT INTO producto_caracteristica VALUES (378, 63, 21);
INSERT INTO producto_caracteristica VALUES (379, 63, 78);
INSERT INTO producto_caracteristica VALUES (380, 63, 149);
INSERT INTO producto_caracteristica VALUES (381, 63, 115);
INSERT INTO producto_caracteristica VALUES (382, 63, 198);
INSERT INTO producto_caracteristica VALUES (383, 63, 5);
INSERT INTO producto_caracteristica VALUES (384, 64, 73);
INSERT INTO producto_caracteristica VALUES (385, 64, 33);
INSERT INTO producto_caracteristica VALUES (386, 64, 78);
INSERT INTO producto_caracteristica VALUES (387, 64, 146);
INSERT INTO producto_caracteristica VALUES (388, 64, 113);
INSERT INTO producto_caracteristica VALUES (389, 64, 200);
INSERT INTO producto_caracteristica VALUES (390, 64, 6);
INSERT INTO producto_caracteristica VALUES (391, 65, 73);
INSERT INTO producto_caracteristica VALUES (392, 65, 12);
INSERT INTO producto_caracteristica VALUES (393, 65, 78);
INSERT INTO producto_caracteristica VALUES (394, 65, 146);
INSERT INTO producto_caracteristica VALUES (395, 65, 115);
INSERT INTO producto_caracteristica VALUES (396, 65, 201);
INSERT INTO producto_caracteristica VALUES (397, 65, 6);
INSERT INTO producto_caracteristica VALUES (398, 66, 73);
INSERT INTO producto_caracteristica VALUES (399, 66, 28);
INSERT INTO producto_caracteristica VALUES (400, 66, 75);
INSERT INTO producto_caracteristica VALUES (401, 66, 149);
INSERT INTO producto_caracteristica VALUES (402, 66, 203);
INSERT INTO producto_caracteristica VALUES (403, 66, 202);
INSERT INTO producto_caracteristica VALUES (404, 66, 6);
INSERT INTO producto_caracteristica VALUES (405, 67, 73);
INSERT INTO producto_caracteristica VALUES (406, 67, 33);
INSERT INTO producto_caracteristica VALUES (407, 67, 75);
INSERT INTO producto_caracteristica VALUES (408, 67, 187);
INSERT INTO producto_caracteristica VALUES (409, 67, 203);
INSERT INTO producto_caracteristica VALUES (410, 67, 204);
INSERT INTO producto_caracteristica VALUES (411, 67, 6);
INSERT INTO producto_caracteristica VALUES (412, 68, 73);
INSERT INTO producto_caracteristica VALUES (413, 68, 53);
INSERT INTO producto_caracteristica VALUES (414, 68, 75);
INSERT INTO producto_caracteristica VALUES (415, 68, 149);
INSERT INTO producto_caracteristica VALUES (416, 68, 203);
INSERT INTO producto_caracteristica VALUES (417, 68, 204);
INSERT INTO producto_caracteristica VALUES (418, 68, 13);
INSERT INTO producto_caracteristica VALUES (419, 69, 71);
INSERT INTO producto_caracteristica VALUES (420, 69, 28);
INSERT INTO producto_caracteristica VALUES (421, 69, 76);
INSERT INTO producto_caracteristica VALUES (422, 69, 190);
INSERT INTO producto_caracteristica VALUES (423, 69, 113);
INSERT INTO producto_caracteristica VALUES (424, 69, 205);
INSERT INTO producto_caracteristica VALUES (425, 69, 5);
INSERT INTO producto_caracteristica VALUES (433, 71, 71);
INSERT INTO producto_caracteristica VALUES (434, 71, 22);
INSERT INTO producto_caracteristica VALUES (435, 71, 75);
INSERT INTO producto_caracteristica VALUES (436, 71, 207);
INSERT INTO producto_caracteristica VALUES (437, 71, 113);
INSERT INTO producto_caracteristica VALUES (438, 71, 208);
INSERT INTO producto_caracteristica VALUES (439, 71, 5);
INSERT INTO producto_caracteristica VALUES (440, 70, 6);
INSERT INTO producto_caracteristica VALUES (441, 70, 25);
INSERT INTO producto_caracteristica VALUES (442, 70, 75);
INSERT INTO producto_caracteristica VALUES (443, 70, 113);
INSERT INTO producto_caracteristica VALUES (444, 70, 207);
INSERT INTO producto_caracteristica VALUES (445, 70, 208);
INSERT INTO producto_caracteristica VALUES (446, 70, 71);
INSERT INTO producto_caracteristica VALUES (447, 72, 71);
INSERT INTO producto_caracteristica VALUES (448, 72, 48);
INSERT INTO producto_caracteristica VALUES (449, 72, 207);
INSERT INTO producto_caracteristica VALUES (450, 72, 113);
INSERT INTO producto_caracteristica VALUES (451, 72, 209);
INSERT INTO producto_caracteristica VALUES (452, 72, 5);
INSERT INTO producto_caracteristica VALUES (453, 72, 210);
INSERT INTO producto_caracteristica VALUES (454, 73, 70);
INSERT INTO producto_caracteristica VALUES (455, 73, 46);
INSERT INTO producto_caracteristica VALUES (456, 73, 210);
INSERT INTO producto_caracteristica VALUES (457, 73, 207);
INSERT INTO producto_caracteristica VALUES (458, 73, 104);
INSERT INTO producto_caracteristica VALUES (459, 73, 211);
INSERT INTO producto_caracteristica VALUES (460, 73, 5);
INSERT INTO producto_caracteristica VALUES (468, 74, 6);
INSERT INTO producto_caracteristica VALUES (469, 74, 12);
INSERT INTO producto_caracteristica VALUES (470, 74, 71);
INSERT INTO producto_caracteristica VALUES (471, 74, 113);
INSERT INTO producto_caracteristica VALUES (472, 74, 212);
INSERT INTO producto_caracteristica VALUES (473, 74, 213);
INSERT INTO producto_caracteristica VALUES (474, 74, 75);
INSERT INTO producto_caracteristica VALUES (475, 75, 71);
INSERT INTO producto_caracteristica VALUES (476, 75, 21);
INSERT INTO producto_caracteristica VALUES (477, 75, 210);
INSERT INTO producto_caracteristica VALUES (478, 75, 207);
INSERT INTO producto_caracteristica VALUES (479, 75, 113);
INSERT INTO producto_caracteristica VALUES (480, 75, 135);
INSERT INTO producto_caracteristica VALUES (481, 75, 6);
INSERT INTO producto_caracteristica VALUES (482, 76, 71);
INSERT INTO producto_caracteristica VALUES (483, 76, 76);
INSERT INTO producto_caracteristica VALUES (484, 76, 190);
INSERT INTO producto_caracteristica VALUES (485, 76, 22);
INSERT INTO producto_caracteristica VALUES (486, 76, 113);
INSERT INTO producto_caracteristica VALUES (487, 76, 214);
INSERT INTO producto_caracteristica VALUES (488, 76, 5);
INSERT INTO producto_caracteristica VALUES (489, 77, 71);
INSERT INTO producto_caracteristica VALUES (490, 77, 23);
INSERT INTO producto_caracteristica VALUES (491, 77, 210);
INSERT INTO producto_caracteristica VALUES (492, 77, 84);
INSERT INTO producto_caracteristica VALUES (493, 77, 113);
INSERT INTO producto_caracteristica VALUES (494, 77, 186);
INSERT INTO producto_caracteristica VALUES (495, 77, 6);
INSERT INTO producto_caracteristica VALUES (496, 78, 71);
INSERT INTO producto_caracteristica VALUES (497, 78, 22);
INSERT INTO producto_caracteristica VALUES (498, 78, 75);
INSERT INTO producto_caracteristica VALUES (499, 78, 83);
INSERT INTO producto_caracteristica VALUES (500, 78, 113);
INSERT INTO producto_caracteristica VALUES (501, 78, 186);
INSERT INTO producto_caracteristica VALUES (502, 78, 6);
INSERT INTO producto_caracteristica VALUES (503, 79, 71);
INSERT INTO producto_caracteristica VALUES (504, 79, 21);
INSERT INTO producto_caracteristica VALUES (505, 79, 75);
INSERT INTO producto_caracteristica VALUES (506, 79, 190);
INSERT INTO producto_caracteristica VALUES (507, 79, 113);
INSERT INTO producto_caracteristica VALUES (508, 79, 205);
INSERT INTO producto_caracteristica VALUES (509, 79, 6);
INSERT INTO producto_caracteristica VALUES (517, 80, 6);
INSERT INTO producto_caracteristica VALUES (518, 80, 12);
INSERT INTO producto_caracteristica VALUES (519, 80, 71);
INSERT INTO producto_caracteristica VALUES (520, 80, 78);
INSERT INTO producto_caracteristica VALUES (521, 80, 113);
INSERT INTO producto_caracteristica VALUES (522, 80, 149);
INSERT INTO producto_caracteristica VALUES (523, 80, 223);
INSERT INTO producto_caracteristica VALUES (524, 80, 218);
INSERT INTO producto_caracteristica VALUES (525, 81, 71);
INSERT INTO producto_caracteristica VALUES (526, 81, 23);
INSERT INTO producto_caracteristica VALUES (527, 81, 75);
INSERT INTO producto_caracteristica VALUES (528, 81, 149);
INSERT INTO producto_caracteristica VALUES (529, 81, 113);
INSERT INTO producto_caracteristica VALUES (530, 81, 224);
INSERT INTO producto_caracteristica VALUES (531, 81, 5);
INSERT INTO producto_caracteristica VALUES (532, 81, 218);
INSERT INTO producto_caracteristica VALUES (533, 82, 71);
INSERT INTO producto_caracteristica VALUES (534, 82, 23);
INSERT INTO producto_caracteristica VALUES (535, 82, 75);
INSERT INTO producto_caracteristica VALUES (536, 82, 149);
INSERT INTO producto_caracteristica VALUES (537, 82, 113);
INSERT INTO producto_caracteristica VALUES (538, 82, 224);
INSERT INTO producto_caracteristica VALUES (539, 82, 5);
INSERT INTO producto_caracteristica VALUES (540, 83, 71);
INSERT INTO producto_caracteristica VALUES (541, 83, 23);
INSERT INTO producto_caracteristica VALUES (542, 83, 75);
INSERT INTO producto_caracteristica VALUES (543, 83, 83);
INSERT INTO producto_caracteristica VALUES (544, 83, 113);
INSERT INTO producto_caracteristica VALUES (545, 83, 225);
INSERT INTO producto_caracteristica VALUES (546, 83, 6);
INSERT INTO producto_caracteristica VALUES (547, 84, 71);
INSERT INTO producto_caracteristica VALUES (548, 84, 22);
INSERT INTO producto_caracteristica VALUES (549, 84, 75);
INSERT INTO producto_caracteristica VALUES (550, 84, 83);
INSERT INTO producto_caracteristica VALUES (551, 84, 113);
INSERT INTO producto_caracteristica VALUES (552, 84, 225);
INSERT INTO producto_caracteristica VALUES (553, 84, 5);
INSERT INTO producto_caracteristica VALUES (554, 85, 71);
INSERT INTO producto_caracteristica VALUES (555, 85, 22);
INSERT INTO producto_caracteristica VALUES (556, 85, 75);
INSERT INTO producto_caracteristica VALUES (557, 85, 83);
INSERT INTO producto_caracteristica VALUES (558, 85, 113);
INSERT INTO producto_caracteristica VALUES (559, 85, 226);
INSERT INTO producto_caracteristica VALUES (560, 85, 5);
INSERT INTO producto_caracteristica VALUES (561, 86, 73);
INSERT INTO producto_caracteristica VALUES (562, 86, 56);
INSERT INTO producto_caracteristica VALUES (563, 86, 78);
INSERT INTO producto_caracteristica VALUES (564, 86, 81);
INSERT INTO producto_caracteristica VALUES (565, 86, 228);
INSERT INTO producto_caracteristica VALUES (566, 86, 227);
INSERT INTO producto_caracteristica VALUES (567, 86, 5);
INSERT INTO producto_caracteristica VALUES (589, 89, 71);
INSERT INTO producto_caracteristica VALUES (590, 89, 76);
INSERT INTO producto_caracteristica VALUES (591, 89, 149);
INSERT INTO producto_caracteristica VALUES (592, 89, 115);
INSERT INTO producto_caracteristica VALUES (593, 89, 22);
INSERT INTO producto_caracteristica VALUES (594, 89, 232);
INSERT INTO producto_caracteristica VALUES (595, 89, 5);
INSERT INTO producto_caracteristica VALUES (602, 87, 5);
INSERT INTO producto_caracteristica VALUES (603, 87, 71);
INSERT INTO producto_caracteristica VALUES (604, 87, 76);
INSERT INTO producto_caracteristica VALUES (605, 87, 113);
INSERT INTO producto_caracteristica VALUES (606, 87, 207);
INSERT INTO producto_caracteristica VALUES (607, 87, 229);
INSERT INTO producto_caracteristica VALUES (608, 87, 234);
INSERT INTO producto_caracteristica VALUES (609, 88, 6);
INSERT INTO producto_caracteristica VALUES (610, 88, 71);
INSERT INTO producto_caracteristica VALUES (611, 88, 76);
INSERT INTO producto_caracteristica VALUES (612, 88, 113);
INSERT INTO producto_caracteristica VALUES (613, 88, 207);
INSERT INTO producto_caracteristica VALUES (614, 88, 229);
INSERT INTO producto_caracteristica VALUES (615, 88, 233);
INSERT INTO producto_caracteristica VALUES (623, 90, 13);
INSERT INTO producto_caracteristica VALUES (624, 90, 46);
INSERT INTO producto_caracteristica VALUES (625, 90, 78);
INSERT INTO producto_caracteristica VALUES (626, 90, 104);
INSERT INTO producto_caracteristica VALUES (627, 90, 146);
INSERT INTO producto_caracteristica VALUES (628, 90, 235);
INSERT INTO producto_caracteristica VALUES (629, 90, 70);
INSERT INTO producto_caracteristica VALUES (630, 91, 71);
INSERT INTO producto_caracteristica VALUES (631, 91, 22);
INSERT INTO producto_caracteristica VALUES (632, 91, 78);
INSERT INTO producto_caracteristica VALUES (633, 91, 84);
INSERT INTO producto_caracteristica VALUES (634, 91, 104);
INSERT INTO producto_caracteristica VALUES (635, 91, 236);
INSERT INTO producto_caracteristica VALUES (636, 91, 5);
INSERT INTO producto_caracteristica VALUES (637, 92, 71);
INSERT INTO producto_caracteristica VALUES (638, 92, 20);
INSERT INTO producto_caracteristica VALUES (639, 92, 75);
INSERT INTO producto_caracteristica VALUES (640, 92, 83);
INSERT INTO producto_caracteristica VALUES (641, 92, 113);
INSERT INTO producto_caracteristica VALUES (642, 92, 226);
INSERT INTO producto_caracteristica VALUES (643, 92, 5);
INSERT INTO producto_caracteristica VALUES (644, 93, 70);
INSERT INTO producto_caracteristica VALUES (645, 93, 12);
INSERT INTO producto_caracteristica VALUES (646, 93, 76);
INSERT INTO producto_caracteristica VALUES (647, 93, 146);
INSERT INTO producto_caracteristica VALUES (648, 93, 203);
INSERT INTO producto_caracteristica VALUES (649, 93, 237);
INSERT INTO producto_caracteristica VALUES (650, 93, 5);
INSERT INTO producto_caracteristica VALUES (651, 94, 70);
INSERT INTO producto_caracteristica VALUES (652, 94, 20);
INSERT INTO producto_caracteristica VALUES (653, 94, 76);
INSERT INTO producto_caracteristica VALUES (654, 94, 146);
INSERT INTO producto_caracteristica VALUES (655, 94, 203);
INSERT INTO producto_caracteristica VALUES (656, 94, 237);
INSERT INTO producto_caracteristica VALUES (657, 94, 5);
INSERT INTO producto_caracteristica VALUES (658, 95, 70);
INSERT INTO producto_caracteristica VALUES (659, 95, 22);
INSERT INTO producto_caracteristica VALUES (660, 95, 76);
INSERT INTO producto_caracteristica VALUES (661, 95, 146);
INSERT INTO producto_caracteristica VALUES (662, 95, 203);
INSERT INTO producto_caracteristica VALUES (663, 95, 237);
INSERT INTO producto_caracteristica VALUES (664, 95, 6);
INSERT INTO producto_caracteristica VALUES (665, 96, 73);
INSERT INTO producto_caracteristica VALUES (666, 96, 20);
INSERT INTO producto_caracteristica VALUES (667, 96, 75);
INSERT INTO producto_caracteristica VALUES (668, 96, 84);
INSERT INTO producto_caracteristica VALUES (669, 96, 115);
INSERT INTO producto_caracteristica VALUES (670, 96, 238);
INSERT INTO producto_caracteristica VALUES (671, 96, 6);
INSERT INTO producto_caracteristica VALUES (672, 97, 70);
INSERT INTO producto_caracteristica VALUES (673, 97, 21);
INSERT INTO producto_caracteristica VALUES (674, 97, 75);
INSERT INTO producto_caracteristica VALUES (675, 97, 84);
INSERT INTO producto_caracteristica VALUES (676, 97, 112);
INSERT INTO producto_caracteristica VALUES (677, 97, 239);
INSERT INTO producto_caracteristica VALUES (678, 97, 5);
INSERT INTO producto_caracteristica VALUES (679, 98, 70);
INSERT INTO producto_caracteristica VALUES (680, 98, 20);
INSERT INTO producto_caracteristica VALUES (681, 98, 75);
INSERT INTO producto_caracteristica VALUES (682, 98, 84);
INSERT INTO producto_caracteristica VALUES (683, 98, 112);
INSERT INTO producto_caracteristica VALUES (684, 98, 239);
INSERT INTO producto_caracteristica VALUES (685, 98, 6);
INSERT INTO producto_caracteristica VALUES (686, 99, 70);
INSERT INTO producto_caracteristica VALUES (687, 99, 46);
INSERT INTO producto_caracteristica VALUES (688, 99, 75);
INSERT INTO producto_caracteristica VALUES (689, 99, 84);
INSERT INTO producto_caracteristica VALUES (690, 99, 104);
INSERT INTO producto_caracteristica VALUES (691, 99, 240);
INSERT INTO producto_caracteristica VALUES (692, 99, 5);
INSERT INTO producto_caracteristica VALUES (693, 100, 73);
INSERT INTO producto_caracteristica VALUES (694, 100, 20);
INSERT INTO producto_caracteristica VALUES (695, 100, 75);
INSERT INTO producto_caracteristica VALUES (696, 100, 146);
INSERT INTO producto_caracteristica VALUES (697, 100, 203);
INSERT INTO producto_caracteristica VALUES (698, 100, 241);
INSERT INTO producto_caracteristica VALUES (699, 101, 73);
INSERT INTO producto_caracteristica VALUES (700, 101, 21);
INSERT INTO producto_caracteristica VALUES (701, 101, 75);
INSERT INTO producto_caracteristica VALUES (702, 101, 146);
INSERT INTO producto_caracteristica VALUES (703, 101, 203);
INSERT INTO producto_caracteristica VALUES (704, 101, 241);
INSERT INTO producto_caracteristica VALUES (705, 101, 5);
INSERT INTO producto_caracteristica VALUES (706, 102, 73);
INSERT INTO producto_caracteristica VALUES (707, 102, 22);
INSERT INTO producto_caracteristica VALUES (708, 102, 75);
INSERT INTO producto_caracteristica VALUES (709, 102, 84);
INSERT INTO producto_caracteristica VALUES (710, 102, 115);
INSERT INTO producto_caracteristica VALUES (711, 102, 238);
INSERT INTO producto_caracteristica VALUES (712, 102, 5);
INSERT INTO producto_caracteristica VALUES (713, 103, 73);
INSERT INTO producto_caracteristica VALUES (714, 103, 21);
INSERT INTO producto_caracteristica VALUES (715, 103, 75);
INSERT INTO producto_caracteristica VALUES (716, 103, 84);
INSERT INTO producto_caracteristica VALUES (717, 103, 115);
INSERT INTO producto_caracteristica VALUES (718, 103, 238);
INSERT INTO producto_caracteristica VALUES (719, 103, 6);
INSERT INTO producto_caracteristica VALUES (720, 104, 71);
INSERT INTO producto_caracteristica VALUES (721, 104, 21);
INSERT INTO producto_caracteristica VALUES (722, 104, 210);
INSERT INTO producto_caracteristica VALUES (723, 104, 84);
INSERT INTO producto_caracteristica VALUES (724, 104, 155);
INSERT INTO producto_caracteristica VALUES (725, 104, 242);
INSERT INTO producto_caracteristica VALUES (726, 104, 6);
INSERT INTO producto_caracteristica VALUES (734, 106, 71);
INSERT INTO producto_caracteristica VALUES (735, 106, 22);
INSERT INTO producto_caracteristica VALUES (736, 106, 210);
INSERT INTO producto_caracteristica VALUES (737, 106, 84);
INSERT INTO producto_caracteristica VALUES (738, 106, 113);
INSERT INTO producto_caracteristica VALUES (739, 106, 244);
INSERT INTO producto_caracteristica VALUES (740, 106, 5);
INSERT INTO producto_caracteristica VALUES (741, 107, 71);
INSERT INTO producto_caracteristica VALUES (742, 107, 245);
INSERT INTO producto_caracteristica VALUES (743, 107, 75);
INSERT INTO producto_caracteristica VALUES (744, 107, 93);
INSERT INTO producto_caracteristica VALUES (745, 107, 113);
INSERT INTO producto_caracteristica VALUES (746, 107, 246);
INSERT INTO producto_caracteristica VALUES (747, 107, 6);
INSERT INTO producto_caracteristica VALUES (748, 108, 71);
INSERT INTO producto_caracteristica VALUES (749, 108, 23);
INSERT INTO producto_caracteristica VALUES (750, 108, 76);
INSERT INTO producto_caracteristica VALUES (751, 108, 92);
INSERT INTO producto_caracteristica VALUES (752, 108, 113);
INSERT INTO producto_caracteristica VALUES (753, 108, 247);
INSERT INTO producto_caracteristica VALUES (754, 108, 5);
INSERT INTO producto_caracteristica VALUES (761, 109, 71);
INSERT INTO producto_caracteristica VALUES (762, 109, 23);
INSERT INTO producto_caracteristica VALUES (763, 109, 75);
INSERT INTO producto_caracteristica VALUES (764, 109, 83);
INSERT INTO producto_caracteristica VALUES (765, 109, 113);
INSERT INTO producto_caracteristica VALUES (766, 109, 168);
INSERT INTO producto_caracteristica VALUES (767, 109, 5);
INSERT INTO producto_caracteristica VALUES (768, 110, 71);
INSERT INTO producto_caracteristica VALUES (769, 110, 75);
INSERT INTO producto_caracteristica VALUES (770, 110, 83);
INSERT INTO producto_caracteristica VALUES (771, 110, 113);
INSERT INTO producto_caracteristica VALUES (772, 110, 248);
INSERT INTO producto_caracteristica VALUES (773, 110, 249);
INSERT INTO producto_caracteristica VALUES (774, 110, 6);
INSERT INTO producto_caracteristica VALUES (782, 112, 70);
INSERT INTO producto_caracteristica VALUES (783, 112, 251);
INSERT INTO producto_caracteristica VALUES (784, 112, 75);
INSERT INTO producto_caracteristica VALUES (785, 112, 93);
INSERT INTO producto_caracteristica VALUES (786, 112, 253);
INSERT INTO producto_caracteristica VALUES (787, 112, 252);
INSERT INTO producto_caracteristica VALUES (788, 112, 5);
INSERT INTO producto_caracteristica VALUES (789, 111, 70);
INSERT INTO producto_caracteristica VALUES (790, 111, 250);
INSERT INTO producto_caracteristica VALUES (791, 111, 75);
INSERT INTO producto_caracteristica VALUES (792, 111, 253);
INSERT INTO producto_caracteristica VALUES (793, 111, 252);
INSERT INTO producto_caracteristica VALUES (794, 111, 5);
INSERT INTO producto_caracteristica VALUES (795, 111, 93);
INSERT INTO producto_caracteristica VALUES (796, 113, 71);
INSERT INTO producto_caracteristica VALUES (797, 113, 25);
INSERT INTO producto_caracteristica VALUES (798, 113, 210);
INSERT INTO producto_caracteristica VALUES (799, 113, 146);
INSERT INTO producto_caracteristica VALUES (800, 113, 255);
INSERT INTO producto_caracteristica VALUES (801, 113, 257);
INSERT INTO producto_caracteristica VALUES (802, 113, 5);
INSERT INTO producto_caracteristica VALUES (803, 114, 71);
INSERT INTO producto_caracteristica VALUES (804, 114, 12);
INSERT INTO producto_caracteristica VALUES (805, 114, 76);
INSERT INTO producto_caracteristica VALUES (806, 114, 149);
INSERT INTO producto_caracteristica VALUES (807, 114, 255);
INSERT INTO producto_caracteristica VALUES (808, 114, 243);
INSERT INTO producto_caracteristica VALUES (809, 114, 5);
INSERT INTO producto_caracteristica VALUES (810, 105, 71);
INSERT INTO producto_caracteristica VALUES (811, 105, 12);
INSERT INTO producto_caracteristica VALUES (812, 105, 210);
INSERT INTO producto_caracteristica VALUES (813, 105, 187);
INSERT INTO producto_caracteristica VALUES (814, 105, 243);
INSERT INTO producto_caracteristica VALUES (815, 105, 5);
INSERT INTO producto_caracteristica VALUES (816, 105, 255);
INSERT INTO producto_caracteristica VALUES (817, 115, 71);
INSERT INTO producto_caracteristica VALUES (818, 115, 30);
INSERT INTO producto_caracteristica VALUES (819, 115, 75);
INSERT INTO producto_caracteristica VALUES (820, 115, 259);
INSERT INTO producto_caracteristica VALUES (821, 115, 113);
INSERT INTO producto_caracteristica VALUES (822, 115, 258);
INSERT INTO producto_caracteristica VALUES (823, 115, 6);
INSERT INTO producto_caracteristica VALUES (824, 116, 71);
INSERT INTO producto_caracteristica VALUES (825, 116, 231);
INSERT INTO producto_caracteristica VALUES (826, 116, 210);
INSERT INTO producto_caracteristica VALUES (827, 116, 83);
INSERT INTO producto_caracteristica VALUES (828, 116, 113);
INSERT INTO producto_caracteristica VALUES (829, 116, 260);
INSERT INTO producto_caracteristica VALUES (830, 116, 6);
INSERT INTO producto_caracteristica VALUES (831, 117, 71);
INSERT INTO producto_caracteristica VALUES (832, 117, 12);
INSERT INTO producto_caracteristica VALUES (833, 117, 75);
INSERT INTO producto_caracteristica VALUES (834, 117, 83);
INSERT INTO producto_caracteristica VALUES (835, 117, 113);
INSERT INTO producto_caracteristica VALUES (836, 117, 261);
INSERT INTO producto_caracteristica VALUES (837, 117, 5);
INSERT INTO producto_caracteristica VALUES (838, 118, 71);
INSERT INTO producto_caracteristica VALUES (839, 118, 22);
INSERT INTO producto_caracteristica VALUES (840, 118, 75);
INSERT INTO producto_caracteristica VALUES (841, 118, 88);
INSERT INTO producto_caracteristica VALUES (842, 118, 113);
INSERT INTO producto_caracteristica VALUES (843, 118, 262);
INSERT INTO producto_caracteristica VALUES (844, 118, 5);
INSERT INTO producto_caracteristica VALUES (845, 119, 7);
INSERT INTO producto_caracteristica VALUES (846, 119, 40);
INSERT INTO producto_caracteristica VALUES (847, 119, 76);
INSERT INTO producto_caracteristica VALUES (848, 119, 146);
INSERT INTO producto_caracteristica VALUES (849, 119, 113);
INSERT INTO producto_caracteristica VALUES (850, 119, 263);
INSERT INTO producto_caracteristica VALUES (851, 119, 6);
INSERT INTO producto_caracteristica VALUES (852, 120, 69);
INSERT INTO producto_caracteristica VALUES (853, 120, 23);
INSERT INTO producto_caracteristica VALUES (854, 120, 84);
INSERT INTO producto_caracteristica VALUES (855, 120, 264);
INSERT INTO producto_caracteristica VALUES (856, 120, 265);
INSERT INTO producto_caracteristica VALUES (857, 120, 6);
INSERT INTO producto_caracteristica VALUES (858, 120, 75);
INSERT INTO producto_caracteristica VALUES (859, 121, 71);
INSERT INTO producto_caracteristica VALUES (860, 121, 30);
INSERT INTO producto_caracteristica VALUES (861, 121, 75);
INSERT INTO producto_caracteristica VALUES (862, 121, 84);
INSERT INTO producto_caracteristica VALUES (863, 121, 255);
INSERT INTO producto_caracteristica VALUES (864, 121, 266);
INSERT INTO producto_caracteristica VALUES (865, 121, 5);
INSERT INTO producto_caracteristica VALUES (866, 122, 71);
INSERT INTO producto_caracteristica VALUES (867, 122, 12);
INSERT INTO producto_caracteristica VALUES (868, 122, 75);
INSERT INTO producto_caracteristica VALUES (869, 122, 84);
INSERT INTO producto_caracteristica VALUES (870, 122, 255);
INSERT INTO producto_caracteristica VALUES (871, 122, 267);
INSERT INTO producto_caracteristica VALUES (872, 122, 6);
INSERT INTO producto_caracteristica VALUES (873, 123, 71);
INSERT INTO producto_caracteristica VALUES (874, 123, 231);
INSERT INTO producto_caracteristica VALUES (875, 123, 75);
INSERT INTO producto_caracteristica VALUES (876, 123, 83);
INSERT INTO producto_caracteristica VALUES (877, 123, 255);
INSERT INTO producto_caracteristica VALUES (878, 123, 268);
INSERT INTO producto_caracteristica VALUES (879, 123, 13);
INSERT INTO producto_caracteristica VALUES (880, 124, 71);
INSERT INTO producto_caracteristica VALUES (881, 124, 22);
INSERT INTO producto_caracteristica VALUES (882, 124, 75);
INSERT INTO producto_caracteristica VALUES (883, 124, 84);
INSERT INTO producto_caracteristica VALUES (884, 124, 255);
INSERT INTO producto_caracteristica VALUES (885, 124, 269);
INSERT INTO producto_caracteristica VALUES (886, 124, 5);
INSERT INTO producto_caracteristica VALUES (887, 125, 71);
INSERT INTO producto_caracteristica VALUES (888, 125, 31);
INSERT INTO producto_caracteristica VALUES (889, 125, 210);
INSERT INTO producto_caracteristica VALUES (890, 125, 92);
INSERT INTO producto_caracteristica VALUES (891, 125, 255);
INSERT INTO producto_caracteristica VALUES (892, 125, 270);
INSERT INTO producto_caracteristica VALUES (893, 125, 6);
INSERT INTO producto_caracteristica VALUES (894, 126, 71);
INSERT INTO producto_caracteristica VALUES (895, 126, 23);
INSERT INTO producto_caracteristica VALUES (896, 126, 75);
INSERT INTO producto_caracteristica VALUES (897, 126, 255);
INSERT INTO producto_caracteristica VALUES (898, 126, 271);
INSERT INTO producto_caracteristica VALUES (899, 126, 5);
INSERT INTO producto_caracteristica VALUES (900, 127, 73);
INSERT INTO producto_caracteristica VALUES (901, 127, 21);
INSERT INTO producto_caracteristica VALUES (902, 127, 75);
INSERT INTO producto_caracteristica VALUES (903, 127, 93);
INSERT INTO producto_caracteristica VALUES (904, 127, 273);
INSERT INTO producto_caracteristica VALUES (905, 127, 272);
INSERT INTO producto_caracteristica VALUES (906, 127, 13);
INSERT INTO producto_caracteristica VALUES (907, 128, 73);
INSERT INTO producto_caracteristica VALUES (908, 128, 25);
INSERT INTO producto_caracteristica VALUES (909, 128, 75);
INSERT INTO producto_caracteristica VALUES (910, 128, 90);
INSERT INTO producto_caracteristica VALUES (911, 128, 113);
INSERT INTO producto_caracteristica VALUES (912, 128, 274);
INSERT INTO producto_caracteristica VALUES (913, 128, 6);
INSERT INTO producto_caracteristica VALUES (914, 129, 71);
INSERT INTO producto_caracteristica VALUES (915, 129, 30);
INSERT INTO producto_caracteristica VALUES (916, 129, 75);
INSERT INTO producto_caracteristica VALUES (917, 129, 146);
INSERT INTO producto_caracteristica VALUES (918, 129, 255);
INSERT INTO producto_caracteristica VALUES (919, 129, 257);
INSERT INTO producto_caracteristica VALUES (920, 129, 5);
INSERT INTO producto_caracteristica VALUES (921, 130, 71);
INSERT INTO producto_caracteristica VALUES (922, 130, 23);
INSERT INTO producto_caracteristica VALUES (923, 130, 75);
INSERT INTO producto_caracteristica VALUES (924, 130, 206);
INSERT INTO producto_caracteristica VALUES (925, 130, 255);
INSERT INTO producto_caracteristica VALUES (926, 130, 275);
INSERT INTO producto_caracteristica VALUES (927, 130, 6);
INSERT INTO producto_caracteristica VALUES (928, 131, 71);
INSERT INTO producto_caracteristica VALUES (929, 131, 30);
INSERT INTO producto_caracteristica VALUES (930, 131, 75);
INSERT INTO producto_caracteristica VALUES (931, 131, 190);
INSERT INTO producto_caracteristica VALUES (932, 131, 255);
INSERT INTO producto_caracteristica VALUES (933, 131, 276);
INSERT INTO producto_caracteristica VALUES (934, 131, 6);
INSERT INTO producto_caracteristica VALUES (935, 132, 71);
INSERT INTO producto_caracteristica VALUES (936, 132, 22);
INSERT INTO producto_caracteristica VALUES (937, 132, 78);
INSERT INTO producto_caracteristica VALUES (938, 132, 146);
INSERT INTO producto_caracteristica VALUES (939, 132, 104);
INSERT INTO producto_caracteristica VALUES (940, 132, 278);
INSERT INTO producto_caracteristica VALUES (941, 132, 5);
INSERT INTO producto_caracteristica VALUES (942, 133, 73);
INSERT INTO producto_caracteristica VALUES (943, 133, 21);
INSERT INTO producto_caracteristica VALUES (944, 133, 75);
INSERT INTO producto_caracteristica VALUES (945, 133, 84);
INSERT INTO producto_caracteristica VALUES (946, 133, 115);
INSERT INTO producto_caracteristica VALUES (947, 133, 238);
INSERT INTO producto_caracteristica VALUES (948, 133, 6);
INSERT INTO producto_caracteristica VALUES (949, 134, 73);
INSERT INTO producto_caracteristica VALUES (950, 134, 61);
INSERT INTO producto_caracteristica VALUES (951, 134, 78);
INSERT INTO producto_caracteristica VALUES (952, 134, 146);
INSERT INTO producto_caracteristica VALUES (953, 134, 104);
INSERT INTO producto_caracteristica VALUES (954, 134, 279);
INSERT INTO producto_caracteristica VALUES (955, 134, 5);
INSERT INTO producto_caracteristica VALUES (956, 135, 73);
INSERT INTO producto_caracteristica VALUES (957, 135, 43);
INSERT INTO producto_caracteristica VALUES (958, 135, 78);
INSERT INTO producto_caracteristica VALUES (959, 135, 146);
INSERT INTO producto_caracteristica VALUES (960, 135, 104);
INSERT INTO producto_caracteristica VALUES (961, 135, 279);
INSERT INTO producto_caracteristica VALUES (962, 135, 5);
INSERT INTO producto_caracteristica VALUES (963, 136, 70);
INSERT INTO producto_caracteristica VALUES (964, 136, 22);
INSERT INTO producto_caracteristica VALUES (965, 136, 78);
INSERT INTO producto_caracteristica VALUES (966, 136, 90);
INSERT INTO producto_caracteristica VALUES (967, 136, 113);
INSERT INTO producto_caracteristica VALUES (968, 136, 280);
INSERT INTO producto_caracteristica VALUES (969, 136, 6);
INSERT INTO producto_caracteristica VALUES (970, 137, 70);
INSERT INTO producto_caracteristica VALUES (971, 137, 25);
INSERT INTO producto_caracteristica VALUES (972, 137, 78);
INSERT INTO producto_caracteristica VALUES (973, 137, 90);
INSERT INTO producto_caracteristica VALUES (974, 137, 113);
INSERT INTO producto_caracteristica VALUES (975, 137, 280);
INSERT INTO producto_caracteristica VALUES (976, 137, 5);
INSERT INTO producto_caracteristica VALUES (977, 138, 7);
INSERT INTO producto_caracteristica VALUES (978, 138, 36);
INSERT INTO producto_caracteristica VALUES (979, 138, 77);
INSERT INTO producto_caracteristica VALUES (980, 138, 149);
INSERT INTO producto_caracteristica VALUES (981, 138, 113);
INSERT INTO producto_caracteristica VALUES (982, 138, 281);
INSERT INTO producto_caracteristica VALUES (983, 138, 6);
INSERT INTO producto_caracteristica VALUES (984, 139, 7);
INSERT INTO producto_caracteristica VALUES (985, 139, 22);
INSERT INTO producto_caracteristica VALUES (986, 139, 77);
INSERT INTO producto_caracteristica VALUES (987, 139, 149);
INSERT INTO producto_caracteristica VALUES (988, 139, 113);
INSERT INTO producto_caracteristica VALUES (989, 139, 281);
INSERT INTO producto_caracteristica VALUES (990, 139, 5);
INSERT INTO producto_caracteristica VALUES (991, 140, 71);
INSERT INTO producto_caracteristica VALUES (992, 140, 22);
INSERT INTO producto_caracteristica VALUES (993, 140, 78);
INSERT INTO producto_caracteristica VALUES (994, 140, 282);
INSERT INTO producto_caracteristica VALUES (995, 140, 113);
INSERT INTO producto_caracteristica VALUES (996, 140, 283);
INSERT INTO producto_caracteristica VALUES (997, 140, 13);
INSERT INTO producto_caracteristica VALUES (998, 141, 7);
INSERT INTO producto_caracteristica VALUES (999, 141, 25);
INSERT INTO producto_caracteristica VALUES (1000, 141, 78);
INSERT INTO producto_caracteristica VALUES (1001, 141, 84);
INSERT INTO producto_caracteristica VALUES (1002, 141, 104);
INSERT INTO producto_caracteristica VALUES (1003, 141, 284);
INSERT INTO producto_caracteristica VALUES (1004, 141, 13);
INSERT INTO producto_caracteristica VALUES (1005, 142, 71);
INSERT INTO producto_caracteristica VALUES (1006, 142, 30);
INSERT INTO producto_caracteristica VALUES (1007, 142, 75);
INSERT INTO producto_caracteristica VALUES (1008, 142, 206);
INSERT INTO producto_caracteristica VALUES (1009, 142, 113);
INSERT INTO producto_caracteristica VALUES (1010, 142, 285);
INSERT INTO producto_caracteristica VALUES (1011, 142, 5);
INSERT INTO producto_caracteristica VALUES (1012, 143, 73);
INSERT INTO producto_caracteristica VALUES (1013, 143, 28);
INSERT INTO producto_caracteristica VALUES (1014, 143, 75);
INSERT INTO producto_caracteristica VALUES (1015, 143, 83);
INSERT INTO producto_caracteristica VALUES (1016, 143, 203);
INSERT INTO producto_caracteristica VALUES (1017, 143, 286);
INSERT INTO producto_caracteristica VALUES (1018, 143, 6);
INSERT INTO producto_caracteristica VALUES (1019, 144, 73);
INSERT INTO producto_caracteristica VALUES (1020, 144, 21);
INSERT INTO producto_caracteristica VALUES (1021, 144, 75);
INSERT INTO producto_caracteristica VALUES (1022, 144, 83);
INSERT INTO producto_caracteristica VALUES (1023, 144, 203);
INSERT INTO producto_caracteristica VALUES (1024, 144, 286);
INSERT INTO producto_caracteristica VALUES (1025, 144, 5);
INSERT INTO producto_caracteristica VALUES (1026, 145, 73);
INSERT INTO producto_caracteristica VALUES (1027, 145, 52);
INSERT INTO producto_caracteristica VALUES (1028, 145, 210);
INSERT INTO producto_caracteristica VALUES (1029, 145, 83);
INSERT INTO producto_caracteristica VALUES (1030, 145, 273);
INSERT INTO producto_caracteristica VALUES (1031, 145, 287);
INSERT INTO producto_caracteristica VALUES (1032, 145, 5);
INSERT INTO producto_caracteristica VALUES (1033, 146, 73);
INSERT INTO producto_caracteristica VALUES (1034, 146, 33);
INSERT INTO producto_caracteristica VALUES (1035, 146, 210);
INSERT INTO producto_caracteristica VALUES (1036, 146, 83);
INSERT INTO producto_caracteristica VALUES (1037, 146, 273);
INSERT INTO producto_caracteristica VALUES (1038, 146, 287);
INSERT INTO producto_caracteristica VALUES (1039, 146, 5);
INSERT INTO producto_caracteristica VALUES (1047, 148, 7);
INSERT INTO producto_caracteristica VALUES (1048, 148, 21);
INSERT INTO producto_caracteristica VALUES (1049, 148, 75);
INSERT INTO producto_caracteristica VALUES (1050, 148, 83);
INSERT INTO producto_caracteristica VALUES (1051, 148, 255);
INSERT INTO producto_caracteristica VALUES (1052, 148, 288);
INSERT INTO producto_caracteristica VALUES (1053, 148, 6);
INSERT INTO producto_caracteristica VALUES (1054, 149, 71);
INSERT INTO producto_caracteristica VALUES (1055, 149, 22);
INSERT INTO producto_caracteristica VALUES (1056, 149, 75);
INSERT INTO producto_caracteristica VALUES (1057, 149, 83);
INSERT INTO producto_caracteristica VALUES (1058, 149, 255);
INSERT INTO producto_caracteristica VALUES (1059, 149, 277);
INSERT INTO producto_caracteristica VALUES (1060, 149, 6);
INSERT INTO producto_caracteristica VALUES (1061, 150, 73);
INSERT INTO producto_caracteristica VALUES (1062, 150, 32);
INSERT INTO producto_caracteristica VALUES (1063, 150, 75);
INSERT INTO producto_caracteristica VALUES (1064, 150, 83);
INSERT INTO producto_caracteristica VALUES (1065, 150, 273);
INSERT INTO producto_caracteristica VALUES (1066, 150, 289);
INSERT INTO producto_caracteristica VALUES (1067, 150, 5);
INSERT INTO producto_caracteristica VALUES (1068, 151, 73);
INSERT INTO producto_caracteristica VALUES (1069, 151, 21);
INSERT INTO producto_caracteristica VALUES (1070, 151, 75);
INSERT INTO producto_caracteristica VALUES (1071, 151, 84);
INSERT INTO producto_caracteristica VALUES (1072, 151, 290);
INSERT INTO producto_caracteristica VALUES (1073, 151, 291);
INSERT INTO producto_caracteristica VALUES (1074, 151, 6);
INSERT INTO producto_caracteristica VALUES (1075, 152, 70);
INSERT INTO producto_caracteristica VALUES (1076, 152, 32);
INSERT INTO producto_caracteristica VALUES (1077, 152, 78);
INSERT INTO producto_caracteristica VALUES (1078, 152, 190);
INSERT INTO producto_caracteristica VALUES (1079, 152, 113);
INSERT INTO producto_caracteristica VALUES (1080, 152, 5);
INSERT INTO producto_caracteristica VALUES (1081, 152, 292);
INSERT INTO producto_caracteristica VALUES (1096, 155, 7);
INSERT INTO producto_caracteristica VALUES (1097, 155, 22);
INSERT INTO producto_caracteristica VALUES (1098, 155, 75);
INSERT INTO producto_caracteristica VALUES (1099, 155, 84);
INSERT INTO producto_caracteristica VALUES (1100, 155, 290);
INSERT INTO producto_caracteristica VALUES (1101, 155, 293);
INSERT INTO producto_caracteristica VALUES (1102, 155, 6);
INSERT INTO producto_caracteristica VALUES (1103, 154, 7);
INSERT INTO producto_caracteristica VALUES (1104, 154, 31);
INSERT INTO producto_caracteristica VALUES (1105, 154, 75);
INSERT INTO producto_caracteristica VALUES (1106, 154, 84);
INSERT INTO producto_caracteristica VALUES (1107, 154, 293);
INSERT INTO producto_caracteristica VALUES (1108, 154, 5);
INSERT INTO producto_caracteristica VALUES (1109, 154, 290);
INSERT INTO producto_caracteristica VALUES (1110, 156, 7);
INSERT INTO producto_caracteristica VALUES (1111, 156, 30);
INSERT INTO producto_caracteristica VALUES (1112, 156, 75);
INSERT INTO producto_caracteristica VALUES (1113, 156, 84);
INSERT INTO producto_caracteristica VALUES (1114, 156, 290);
INSERT INTO producto_caracteristica VALUES (1115, 156, 293);
INSERT INTO producto_caracteristica VALUES (1116, 156, 6);
INSERT INTO producto_caracteristica VALUES (1117, 157, 73);
INSERT INTO producto_caracteristica VALUES (1118, 157, 21);
INSERT INTO producto_caracteristica VALUES (1119, 157, 77);
INSERT INTO producto_caracteristica VALUES (1120, 157, 92);
INSERT INTO producto_caracteristica VALUES (1121, 157, 294);
INSERT INTO producto_caracteristica VALUES (1122, 157, 295);
INSERT INTO producto_caracteristica VALUES (1123, 157, 6);
INSERT INTO producto_caracteristica VALUES (1124, 158, 73);
INSERT INTO producto_caracteristica VALUES (1125, 158, 21);
INSERT INTO producto_caracteristica VALUES (1126, 158, 210);
INSERT INTO producto_caracteristica VALUES (1127, 158, 296);
INSERT INTO producto_caracteristica VALUES (1128, 158, 113);
INSERT INTO producto_caracteristica VALUES (1129, 158, 297);
INSERT INTO producto_caracteristica VALUES (1130, 158, 6);
INSERT INTO producto_caracteristica VALUES (1131, 159, 71);
INSERT INTO producto_caracteristica VALUES (1132, 159, 9);
INSERT INTO producto_caracteristica VALUES (1133, 159, 75);
INSERT INTO producto_caracteristica VALUES (1134, 159, 83);
INSERT INTO producto_caracteristica VALUES (1135, 159, 255);
INSERT INTO producto_caracteristica VALUES (1136, 159, 298);
INSERT INTO producto_caracteristica VALUES (1137, 159, 5);
INSERT INTO producto_caracteristica VALUES (1138, 160, 20);
INSERT INTO producto_caracteristica VALUES (1139, 160, 210);
INSERT INTO producto_caracteristica VALUES (1140, 160, 83);
INSERT INTO producto_caracteristica VALUES (1141, 160, 70);
INSERT INTO producto_caracteristica VALUES (1142, 160, 264);
INSERT INTO producto_caracteristica VALUES (1143, 160, 299);
INSERT INTO producto_caracteristica VALUES (1144, 160, 5);
INSERT INTO producto_caracteristica VALUES (1145, 161, 70);
INSERT INTO producto_caracteristica VALUES (1146, 161, 53);
INSERT INTO producto_caracteristica VALUES (1147, 161, 210);
INSERT INTO producto_caracteristica VALUES (1148, 161, 83);
INSERT INTO producto_caracteristica VALUES (1149, 161, 264);
INSERT INTO producto_caracteristica VALUES (1150, 161, 299);
INSERT INTO producto_caracteristica VALUES (1151, 161, 6);
INSERT INTO producto_caracteristica VALUES (1152, 162, 71);
INSERT INTO producto_caracteristica VALUES (1153, 162, 12);
INSERT INTO producto_caracteristica VALUES (1154, 162, 75);
INSERT INTO producto_caracteristica VALUES (1155, 162, 83);
INSERT INTO producto_caracteristica VALUES (1156, 162, 255);
INSERT INTO producto_caracteristica VALUES (1157, 162, 298);
INSERT INTO producto_caracteristica VALUES (1158, 162, 5);
INSERT INTO producto_caracteristica VALUES (1159, 163, 73);
INSERT INTO producto_caracteristica VALUES (1160, 163, 25);
INSERT INTO producto_caracteristica VALUES (1161, 163, 77);
INSERT INTO producto_caracteristica VALUES (1162, 163, 83);
INSERT INTO producto_caracteristica VALUES (1163, 163, 203);
INSERT INTO producto_caracteristica VALUES (1164, 163, 300);
INSERT INTO producto_caracteristica VALUES (1165, 163, 3);
INSERT INTO producto_caracteristica VALUES (1166, 164, 73);
INSERT INTO producto_caracteristica VALUES (1167, 164, 20);
INSERT INTO producto_caracteristica VALUES (1168, 164, 77);
INSERT INTO producto_caracteristica VALUES (1169, 164, 149);
INSERT INTO producto_caracteristica VALUES (1170, 164, 203);
INSERT INTO producto_caracteristica VALUES (1171, 164, 300);
INSERT INTO producto_caracteristica VALUES (1172, 164, 3);
INSERT INTO producto_caracteristica VALUES (1173, 165, 174);
INSERT INTO producto_caracteristica VALUES (1174, 165, 22);
INSERT INTO producto_caracteristica VALUES (1175, 165, 77);
INSERT INTO producto_caracteristica VALUES (1176, 165, 149);
INSERT INTO producto_caracteristica VALUES (1177, 165, 113);
INSERT INTO producto_caracteristica VALUES (1178, 165, 302);
INSERT INTO producto_caracteristica VALUES (1179, 165, 6);
INSERT INTO producto_caracteristica VALUES (1180, 166, 73);
INSERT INTO producto_caracteristica VALUES (1181, 166, 22);
INSERT INTO producto_caracteristica VALUES (1182, 166, 76);
INSERT INTO producto_caracteristica VALUES (1183, 166, 83);
INSERT INTO producto_caracteristica VALUES (1184, 166, 273);
INSERT INTO producto_caracteristica VALUES (1185, 166, 303);
INSERT INTO producto_caracteristica VALUES (1186, 166, 6);
INSERT INTO producto_caracteristica VALUES (1187, 167, 73);
INSERT INTO producto_caracteristica VALUES (1188, 167, 21);
INSERT INTO producto_caracteristica VALUES (1189, 167, 75);
INSERT INTO producto_caracteristica VALUES (1190, 167, 196);
INSERT INTO producto_caracteristica VALUES (1191, 167, 264);
INSERT INTO producto_caracteristica VALUES (1192, 167, 301);
INSERT INTO producto_caracteristica VALUES (1193, 167, 5);
INSERT INTO producto_caracteristica VALUES (1194, 168, 70);
INSERT INTO producto_caracteristica VALUES (1195, 168, 53);
INSERT INTO producto_caracteristica VALUES (1196, 168, 210);
INSERT INTO producto_caracteristica VALUES (1197, 168, 146);
INSERT INTO producto_caracteristica VALUES (1198, 168, 182);
INSERT INTO producto_caracteristica VALUES (1199, 168, 304);
INSERT INTO producto_caracteristica VALUES (1200, 168, 13);
INSERT INTO producto_caracteristica VALUES (1201, 169, 70);
INSERT INTO producto_caracteristica VALUES (1202, 169, 20);
INSERT INTO producto_caracteristica VALUES (1203, 169, 210);
INSERT INTO producto_caracteristica VALUES (1204, 169, 146);
INSERT INTO producto_caracteristica VALUES (1205, 169, 182);
INSERT INTO producto_caracteristica VALUES (1206, 169, 304);
INSERT INTO producto_caracteristica VALUES (1207, 169, 6);
INSERT INTO producto_caracteristica VALUES (1208, 170, 73);
INSERT INTO producto_caracteristica VALUES (1209, 170, 22);
INSERT INTO producto_caracteristica VALUES (1210, 170, 77);
INSERT INTO producto_caracteristica VALUES (1211, 170, 306);
INSERT INTO producto_caracteristica VALUES (1212, 170, 264);
INSERT INTO producto_caracteristica VALUES (1213, 170, 305);
INSERT INTO producto_caracteristica VALUES (1214, 171, 73);
INSERT INTO producto_caracteristica VALUES (1215, 171, 53);
INSERT INTO producto_caracteristica VALUES (1216, 171, 77);
INSERT INTO producto_caracteristica VALUES (1217, 171, 149);
INSERT INTO producto_caracteristica VALUES (1218, 171, 308);
INSERT INTO producto_caracteristica VALUES (1219, 171, 307);
INSERT INTO producto_caracteristica VALUES (1220, 171, 5);
INSERT INTO producto_caracteristica VALUES (1221, 172, 73);
INSERT INTO producto_caracteristica VALUES (1222, 172, 9);
INSERT INTO producto_caracteristica VALUES (1223, 172, 76);
INSERT INTO producto_caracteristica VALUES (1224, 172, 149);
INSERT INTO producto_caracteristica VALUES (1225, 172, 308);
INSERT INTO producto_caracteristica VALUES (1226, 172, 309);
INSERT INTO producto_caracteristica VALUES (1227, 172, 5);
INSERT INTO producto_caracteristica VALUES (1228, 173, 73);
INSERT INTO producto_caracteristica VALUES (1229, 173, 9);
INSERT INTO producto_caracteristica VALUES (1230, 173, 77);
INSERT INTO producto_caracteristica VALUES (1231, 173, 146);
INSERT INTO producto_caracteristica VALUES (1232, 173, 182);
INSERT INTO producto_caracteristica VALUES (1233, 173, 310);
INSERT INTO producto_caracteristica VALUES (1234, 173, 5);
INSERT INTO producto_caracteristica VALUES (1235, 174, 73);
INSERT INTO producto_caracteristica VALUES (1236, 174, 33);
INSERT INTO producto_caracteristica VALUES (1237, 174, 77);
INSERT INTO producto_caracteristica VALUES (1238, 174, 149);
INSERT INTO producto_caracteristica VALUES (1239, 174, 115);
INSERT INTO producto_caracteristica VALUES (1240, 174, 311);
INSERT INTO producto_caracteristica VALUES (1241, 174, 5);
INSERT INTO producto_caracteristica VALUES (1242, 175, 73);
INSERT INTO producto_caracteristica VALUES (1243, 175, 23);
INSERT INTO producto_caracteristica VALUES (1244, 175, 77);
INSERT INTO producto_caracteristica VALUES (1245, 175, 306);
INSERT INTO producto_caracteristica VALUES (1246, 175, 107);
INSERT INTO producto_caracteristica VALUES (1247, 175, 312);
INSERT INTO producto_caracteristica VALUES (1248, 175, 6);
INSERT INTO producto_caracteristica VALUES (1249, 176, 73);
INSERT INTO producto_caracteristica VALUES (1250, 176, 40);
INSERT INTO producto_caracteristica VALUES (1251, 176, 77);
INSERT INTO producto_caracteristica VALUES (1252, 176, 149);
INSERT INTO producto_caracteristica VALUES (1253, 176, 113);
INSERT INTO producto_caracteristica VALUES (1254, 176, 313);
INSERT INTO producto_caracteristica VALUES (1255, 176, 5);
INSERT INTO producto_caracteristica VALUES (1256, 177, 73);
INSERT INTO producto_caracteristica VALUES (1257, 177, 22);
INSERT INTO producto_caracteristica VALUES (1258, 177, 78);
INSERT INTO producto_caracteristica VALUES (1259, 177, 146);
INSERT INTO producto_caracteristica VALUES (1260, 177, 290);
INSERT INTO producto_caracteristica VALUES (1261, 177, 314);
INSERT INTO producto_caracteristica VALUES (1262, 177, 14);
INSERT INTO producto_caracteristica VALUES (1263, 178, 73);
INSERT INTO producto_caracteristica VALUES (1264, 178, 25);
INSERT INTO producto_caracteristica VALUES (1265, 178, 77);
INSERT INTO producto_caracteristica VALUES (1266, 178, 149);
INSERT INTO producto_caracteristica VALUES (1267, 178, 308);
INSERT INTO producto_caracteristica VALUES (1268, 178, 307);
INSERT INTO producto_caracteristica VALUES (1269, 178, 5);
INSERT INTO producto_caracteristica VALUES (1270, 179, 73);
INSERT INTO producto_caracteristica VALUES (1271, 179, 22);
INSERT INTO producto_caracteristica VALUES (1272, 179, 78);
INSERT INTO producto_caracteristica VALUES (1273, 179, 146);
INSERT INTO producto_caracteristica VALUES (1274, 179, 161);
INSERT INTO producto_caracteristica VALUES (1275, 179, 315);
INSERT INTO producto_caracteristica VALUES (1276, 179, 6);
INSERT INTO producto_caracteristica VALUES (1277, 180, 7);
INSERT INTO producto_caracteristica VALUES (1278, 180, 23);
INSERT INTO producto_caracteristica VALUES (1279, 180, 78);
INSERT INTO producto_caracteristica VALUES (1280, 180, 146);
INSERT INTO producto_caracteristica VALUES (1281, 180, 113);
INSERT INTO producto_caracteristica VALUES (1282, 180, 316);
INSERT INTO producto_caracteristica VALUES (1283, 180, 6);
INSERT INTO producto_caracteristica VALUES (1291, 181, 7);
INSERT INTO producto_caracteristica VALUES (1292, 181, 113);
INSERT INTO producto_caracteristica VALUES (1293, 181, 146);
INSERT INTO producto_caracteristica VALUES (1294, 181, 13);
INSERT INTO producto_caracteristica VALUES (1295, 181, 22);
INSERT INTO producto_caracteristica VALUES (1296, 181, 316);
INSERT INTO producto_caracteristica VALUES (1297, 181, 78);
INSERT INTO producto_caracteristica VALUES (1298, 182, 7);
INSERT INTO producto_caracteristica VALUES (1299, 182, 25);
INSERT INTO producto_caracteristica VALUES (1300, 182, 78);
INSERT INTO producto_caracteristica VALUES (1301, 182, 149);
INSERT INTO producto_caracteristica VALUES (1302, 182, 113);
INSERT INTO producto_caracteristica VALUES (1303, 182, 317);
INSERT INTO producto_caracteristica VALUES (1304, 182, 6);
INSERT INTO producto_caracteristica VALUES (1305, 183, 73);
INSERT INTO producto_caracteristica VALUES (1306, 183, 78);
INSERT INTO producto_caracteristica VALUES (1307, 183, 146);
INSERT INTO producto_caracteristica VALUES (1308, 183, 115);
INSERT INTO producto_caracteristica VALUES (1309, 183, 33);
INSERT INTO producto_caracteristica VALUES (1310, 183, 318);
INSERT INTO producto_caracteristica VALUES (1311, 183, 13);
INSERT INTO producto_caracteristica VALUES (1312, 184, 7);
INSERT INTO producto_caracteristica VALUES (1313, 184, 25);
INSERT INTO producto_caracteristica VALUES (1314, 184, 76);
INSERT INTO producto_caracteristica VALUES (1315, 184, 190);
INSERT INTO producto_caracteristica VALUES (1316, 184, 113);
INSERT INTO producto_caracteristica VALUES (1317, 184, 319);
INSERT INTO producto_caracteristica VALUES (1318, 184, 5);
INSERT INTO producto_caracteristica VALUES (1319, 185, 73);
INSERT INTO producto_caracteristica VALUES (1320, 185, 22);
INSERT INTO producto_caracteristica VALUES (1321, 185, 75);
INSERT INTO producto_caracteristica VALUES (1322, 185, 83);
INSERT INTO producto_caracteristica VALUES (1323, 185, 273);
INSERT INTO producto_caracteristica VALUES (1324, 185, 320);
INSERT INTO producto_caracteristica VALUES (1325, 185, 6);
INSERT INTO producto_caracteristica VALUES (1326, 186, 73);
INSERT INTO producto_caracteristica VALUES (1327, 186, 21);
INSERT INTO producto_caracteristica VALUES (1328, 186, 76);
INSERT INTO producto_caracteristica VALUES (1329, 186, 196);
INSERT INTO producto_caracteristica VALUES (1330, 186, 321);
INSERT INTO producto_caracteristica VALUES (1331, 186, 5);
INSERT INTO producto_caracteristica VALUES (1332, 186, 113);
INSERT INTO producto_caracteristica VALUES (1333, 187, 73);
INSERT INTO producto_caracteristica VALUES (1334, 187, 12);
INSERT INTO producto_caracteristica VALUES (1335, 187, 76);
INSERT INTO producto_caracteristica VALUES (1336, 187, 196);
INSERT INTO producto_caracteristica VALUES (1337, 187, 113);
INSERT INTO producto_caracteristica VALUES (1338, 187, 321);
INSERT INTO producto_caracteristica VALUES (1339, 187, 6);
INSERT INTO producto_caracteristica VALUES (1340, 188, 73);
INSERT INTO producto_caracteristica VALUES (1341, 188, 33);
INSERT INTO producto_caracteristica VALUES (1342, 188, 76);
INSERT INTO producto_caracteristica VALUES (1343, 188, 196);
INSERT INTO producto_caracteristica VALUES (1344, 188, 113);
INSERT INTO producto_caracteristica VALUES (1345, 188, 321);
INSERT INTO producto_caracteristica VALUES (1346, 188, 6);
INSERT INTO producto_caracteristica VALUES (1347, 189, 73);
INSERT INTO producto_caracteristica VALUES (1348, 189, 21);
INSERT INTO producto_caracteristica VALUES (1349, 189, 76);
INSERT INTO producto_caracteristica VALUES (1350, 189, 196);
INSERT INTO producto_caracteristica VALUES (1351, 189, 115);
INSERT INTO producto_caracteristica VALUES (1352, 189, 322);
INSERT INTO producto_caracteristica VALUES (1353, 189, 6);
INSERT INTO producto_caracteristica VALUES (1354, 190, 73);
INSERT INTO producto_caracteristica VALUES (1355, 190, 183);
INSERT INTO producto_caracteristica VALUES (1356, 190, 75);
INSERT INTO producto_caracteristica VALUES (1357, 190, 93);
INSERT INTO producto_caracteristica VALUES (1358, 190, 290);
INSERT INTO producto_caracteristica VALUES (1359, 190, 323);
INSERT INTO producto_caracteristica VALUES (1360, 190, 13);
INSERT INTO producto_caracteristica VALUES (1361, 191, 73);
INSERT INTO producto_caracteristica VALUES (1362, 191, 33);
INSERT INTO producto_caracteristica VALUES (1363, 191, 76);
INSERT INTO producto_caracteristica VALUES (1364, 191, 93);
INSERT INTO producto_caracteristica VALUES (1365, 191, 113);
INSERT INTO producto_caracteristica VALUES (1366, 191, 324);
INSERT INTO producto_caracteristica VALUES (1367, 191, 5);
INSERT INTO producto_caracteristica VALUES (1368, 192, 73);
INSERT INTO producto_caracteristica VALUES (1369, 192, 183);
INSERT INTO producto_caracteristica VALUES (1370, 192, 75);
INSERT INTO producto_caracteristica VALUES (1371, 192, 93);
INSERT INTO producto_caracteristica VALUES (1372, 192, 182);
INSERT INTO producto_caracteristica VALUES (1373, 192, 325);
INSERT INTO producto_caracteristica VALUES (1374, 192, 13);
INSERT INTO producto_caracteristica VALUES (1375, 193, 73);
INSERT INTO producto_caracteristica VALUES (1376, 193, 21);
INSERT INTO producto_caracteristica VALUES (1377, 193, 78);
INSERT INTO producto_caracteristica VALUES (1378, 193, 190);
INSERT INTO producto_caracteristica VALUES (1379, 193, 273);
INSERT INTO producto_caracteristica VALUES (1380, 193, 326);
INSERT INTO producto_caracteristica VALUES (1381, 193, 5);
INSERT INTO producto_caracteristica VALUES (1382, 194, 71);
INSERT INTO producto_caracteristica VALUES (1383, 194, 30);
INSERT INTO producto_caracteristica VALUES (1384, 194, 75);
INSERT INTO producto_caracteristica VALUES (1385, 194, 83);
INSERT INTO producto_caracteristica VALUES (1386, 194, 255);
INSERT INTO producto_caracteristica VALUES (1387, 194, 327);
INSERT INTO producto_caracteristica VALUES (1388, 194, 6);
INSERT INTO producto_caracteristica VALUES (1389, 195, 71);
INSERT INTO producto_caracteristica VALUES (1390, 195, 20);
INSERT INTO producto_caracteristica VALUES (1391, 195, 75);
INSERT INTO producto_caracteristica VALUES (1392, 195, 83);
INSERT INTO producto_caracteristica VALUES (1393, 195, 255);
INSERT INTO producto_caracteristica VALUES (1394, 195, 327);
INSERT INTO producto_caracteristica VALUES (1395, 195, 6);
INSERT INTO producto_caracteristica VALUES (1396, 196, 71);
INSERT INTO producto_caracteristica VALUES (1397, 196, 23);
INSERT INTO producto_caracteristica VALUES (1398, 196, 75);
INSERT INTO producto_caracteristica VALUES (1399, 196, 83);
INSERT INTO producto_caracteristica VALUES (1400, 196, 255);
INSERT INTO producto_caracteristica VALUES (1401, 196, 327);
INSERT INTO producto_caracteristica VALUES (1402, 196, 5);
INSERT INTO producto_caracteristica VALUES (1403, 197, 73);
INSERT INTO producto_caracteristica VALUES (1404, 197, 22);
INSERT INTO producto_caracteristica VALUES (1405, 197, 75);
INSERT INTO producto_caracteristica VALUES (1406, 197, 93);
INSERT INTO producto_caracteristica VALUES (1407, 197, 290);
INSERT INTO producto_caracteristica VALUES (1408, 197, 328);
INSERT INTO producto_caracteristica VALUES (1409, 197, 5);
INSERT INTO producto_caracteristica VALUES (1410, 198, 73);
INSERT INTO producto_caracteristica VALUES (1411, 198, 20);
INSERT INTO producto_caracteristica VALUES (1412, 198, 75);
INSERT INTO producto_caracteristica VALUES (1413, 198, 93);
INSERT INTO producto_caracteristica VALUES (1414, 198, 290);
INSERT INTO producto_caracteristica VALUES (1415, 198, 328);
INSERT INTO producto_caracteristica VALUES (1416, 198, 5);
INSERT INTO producto_caracteristica VALUES (1417, 199, 71);
INSERT INTO producto_caracteristica VALUES (1418, 199, 48);
INSERT INTO producto_caracteristica VALUES (1419, 199, 76);
INSERT INTO producto_caracteristica VALUES (1420, 199, 83);
INSERT INTO producto_caracteristica VALUES (1421, 199, 255);
INSERT INTO producto_caracteristica VALUES (1422, 199, 329);
INSERT INTO producto_caracteristica VALUES (1423, 199, 5);
INSERT INTO producto_caracteristica VALUES (1424, 200, 71);
INSERT INTO producto_caracteristica VALUES (1425, 200, 22);
INSERT INTO producto_caracteristica VALUES (1426, 200, 76);
INSERT INTO producto_caracteristica VALUES (1427, 200, 83);
INSERT INTO producto_caracteristica VALUES (1428, 200, 255);
INSERT INTO producto_caracteristica VALUES (1429, 200, 329);
INSERT INTO producto_caracteristica VALUES (1430, 200, 5);
INSERT INTO producto_caracteristica VALUES (1431, 201, 71);
INSERT INTO producto_caracteristica VALUES (1432, 201, 23);
INSERT INTO producto_caracteristica VALUES (1433, 201, 76);
INSERT INTO producto_caracteristica VALUES (1434, 201, 83);
INSERT INTO producto_caracteristica VALUES (1435, 201, 255);
INSERT INTO producto_caracteristica VALUES (1436, 201, 329);
INSERT INTO producto_caracteristica VALUES (1437, 201, 5);
INSERT INTO producto_caracteristica VALUES (1438, 202, 71);
INSERT INTO producto_caracteristica VALUES (1439, 202, 22);
INSERT INTO producto_caracteristica VALUES (1440, 202, 75);
INSERT INTO producto_caracteristica VALUES (1441, 202, 83);
INSERT INTO producto_caracteristica VALUES (1442, 202, 255);
INSERT INTO producto_caracteristica VALUES (1443, 202, 276);
INSERT INTO producto_caracteristica VALUES (1444, 202, 5);
INSERT INTO producto_caracteristica VALUES (1445, 203, 71);
INSERT INTO producto_caracteristica VALUES (1446, 203, 23);
INSERT INTO producto_caracteristica VALUES (1447, 203, 75);
INSERT INTO producto_caracteristica VALUES (1448, 203, 83);
INSERT INTO producto_caracteristica VALUES (1449, 203, 255);
INSERT INTO producto_caracteristica VALUES (1450, 203, 276);
INSERT INTO producto_caracteristica VALUES (1451, 203, 5);
INSERT INTO producto_caracteristica VALUES (1452, 204, 73);
INSERT INTO producto_caracteristica VALUES (1453, 204, 61);
INSERT INTO producto_caracteristica VALUES (1454, 204, 78);
INSERT INTO producto_caracteristica VALUES (1455, 204, 146);
INSERT INTO producto_caracteristica VALUES (1456, 204, 104);
INSERT INTO producto_caracteristica VALUES (1457, 204, 330);
INSERT INTO producto_caracteristica VALUES (1458, 204, 5);
INSERT INTO producto_caracteristica VALUES (1459, 205, 73);
INSERT INTO producto_caracteristica VALUES (1460, 205, 43);
INSERT INTO producto_caracteristica VALUES (1461, 205, 78);
INSERT INTO producto_caracteristica VALUES (1462, 205, 146);
INSERT INTO producto_caracteristica VALUES (1463, 205, 104);
INSERT INTO producto_caracteristica VALUES (1464, 205, 330);
INSERT INTO producto_caracteristica VALUES (1465, 205, 5);
INSERT INTO producto_caracteristica VALUES (1466, 206, 73);
INSERT INTO producto_caracteristica VALUES (1467, 206, 22);
INSERT INTO producto_caracteristica VALUES (1468, 206, 75);
INSERT INTO producto_caracteristica VALUES (1469, 206, 84);
INSERT INTO producto_caracteristica VALUES (1470, 206, 273);
INSERT INTO producto_caracteristica VALUES (1471, 206, 331);
INSERT INTO producto_caracteristica VALUES (1472, 206, 5);
INSERT INTO producto_caracteristica VALUES (1473, 207, 73);
INSERT INTO producto_caracteristica VALUES (1474, 207, 20);
INSERT INTO producto_caracteristica VALUES (1475, 207, 75);
INSERT INTO producto_caracteristica VALUES (1476, 207, 84);
INSERT INTO producto_caracteristica VALUES (1477, 207, 273);
INSERT INTO producto_caracteristica VALUES (1478, 207, 331);
INSERT INTO producto_caracteristica VALUES (1479, 207, 6);
INSERT INTO producto_caracteristica VALUES (1480, 208, 71);
INSERT INTO producto_caracteristica VALUES (1481, 208, 12);
INSERT INTO producto_caracteristica VALUES (1482, 208, 75);
INSERT INTO producto_caracteristica VALUES (1483, 208, 84);
INSERT INTO producto_caracteristica VALUES (1484, 208, 273);
INSERT INTO producto_caracteristica VALUES (1485, 208, 332);
INSERT INTO producto_caracteristica VALUES (1486, 208, 6);
INSERT INTO producto_caracteristica VALUES (1487, 209, 71);
INSERT INTO producto_caracteristica VALUES (1488, 209, 22);
INSERT INTO producto_caracteristica VALUES (1489, 209, 75);
INSERT INTO producto_caracteristica VALUES (1490, 209, 84);
INSERT INTO producto_caracteristica VALUES (1491, 209, 273);
INSERT INTO producto_caracteristica VALUES (1492, 209, 332);
INSERT INTO producto_caracteristica VALUES (1493, 209, 6);
INSERT INTO producto_caracteristica VALUES (1494, 210, 70);
INSERT INTO producto_caracteristica VALUES (1495, 210, 21);
INSERT INTO producto_caracteristica VALUES (1496, 210, 75);
INSERT INTO producto_caracteristica VALUES (1497, 210, 83);
INSERT INTO producto_caracteristica VALUES (1498, 210, 115);
INSERT INTO producto_caracteristica VALUES (1499, 210, 333);
INSERT INTO producto_caracteristica VALUES (1500, 210, 5);
INSERT INTO producto_caracteristica VALUES (1501, 211, 70);
INSERT INTO producto_caracteristica VALUES (1502, 211, 50);
INSERT INTO producto_caracteristica VALUES (1503, 211, 75);
INSERT INTO producto_caracteristica VALUES (1504, 211, 83);
INSERT INTO producto_caracteristica VALUES (1505, 211, 115);
INSERT INTO producto_caracteristica VALUES (1506, 211, 333);
INSERT INTO producto_caracteristica VALUES (1507, 211, 6);
INSERT INTO producto_caracteristica VALUES (1508, 212, 73);
INSERT INTO producto_caracteristica VALUES (1509, 212, 43);
INSERT INTO producto_caracteristica VALUES (1510, 212, 78);
INSERT INTO producto_caracteristica VALUES (1511, 212, 146);
INSERT INTO producto_caracteristica VALUES (1512, 212, 104);
INSERT INTO producto_caracteristica VALUES (1513, 212, 334);
INSERT INTO producto_caracteristica VALUES (1514, 212, 6);
INSERT INTO producto_caracteristica VALUES (1515, 213, 73);
INSERT INTO producto_caracteristica VALUES (1516, 213, 46);
INSERT INTO producto_caracteristica VALUES (1517, 213, 78);
INSERT INTO producto_caracteristica VALUES (1518, 213, 336);
INSERT INTO producto_caracteristica VALUES (1519, 213, 104);
INSERT INTO producto_caracteristica VALUES (1520, 213, 335);
INSERT INTO producto_caracteristica VALUES (1521, 213, 5);
INSERT INTO producto_caracteristica VALUES (1522, 214, 73);
INSERT INTO producto_caracteristica VALUES (1523, 214, 61);
INSERT INTO producto_caracteristica VALUES (1524, 214, 78);
INSERT INTO producto_caracteristica VALUES (1525, 214, 337);
INSERT INTO producto_caracteristica VALUES (1526, 214, 104);
INSERT INTO producto_caracteristica VALUES (1527, 214, 338);
INSERT INTO producto_caracteristica VALUES (1528, 214, 5);
INSERT INTO producto_caracteristica VALUES (1529, 215, 73);
INSERT INTO producto_caracteristica VALUES (1530, 215, 43);
INSERT INTO producto_caracteristica VALUES (1531, 215, 78);
INSERT INTO producto_caracteristica VALUES (1532, 215, 337);
INSERT INTO producto_caracteristica VALUES (1533, 215, 104);
INSERT INTO producto_caracteristica VALUES (1534, 215, 338);
INSERT INTO producto_caracteristica VALUES (1535, 215, 5);
INSERT INTO producto_caracteristica VALUES (1536, 216, 73);
INSERT INTO producto_caracteristica VALUES (1537, 216, 61);
INSERT INTO producto_caracteristica VALUES (1538, 216, 78);
INSERT INTO producto_caracteristica VALUES (1539, 216, 337);
INSERT INTO producto_caracteristica VALUES (1540, 216, 104);
INSERT INTO producto_caracteristica VALUES (1541, 216, 339);
INSERT INTO producto_caracteristica VALUES (1542, 216, 5);
INSERT INTO producto_caracteristica VALUES (1543, 217, 7);
INSERT INTO producto_caracteristica VALUES (1544, 217, 22);
INSERT INTO producto_caracteristica VALUES (1545, 217, 78);
INSERT INTO producto_caracteristica VALUES (1546, 217, 146);
INSERT INTO producto_caracteristica VALUES (1547, 217, 104);
INSERT INTO producto_caracteristica VALUES (1548, 217, 340);
INSERT INTO producto_caracteristica VALUES (1549, 217, 5);
INSERT INTO producto_caracteristica VALUES (1550, 218, 7);
INSERT INTO producto_caracteristica VALUES (1551, 218, 61);
INSERT INTO producto_caracteristica VALUES (1552, 218, 78);
INSERT INTO producto_caracteristica VALUES (1553, 218, 146);
INSERT INTO producto_caracteristica VALUES (1554, 218, 104);
INSERT INTO producto_caracteristica VALUES (1555, 218, 340);
INSERT INTO producto_caracteristica VALUES (1556, 218, 5);
INSERT INTO producto_caracteristica VALUES (1557, 219, 73);
INSERT INTO producto_caracteristica VALUES (1558, 219, 21);
INSERT INTO producto_caracteristica VALUES (1559, 219, 77);
INSERT INTO producto_caracteristica VALUES (1560, 219, 337);
INSERT INTO producto_caracteristica VALUES (1561, 219, 264);
INSERT INTO producto_caracteristica VALUES (1562, 219, 341);
INSERT INTO producto_caracteristica VALUES (1563, 219, 13);
INSERT INTO producto_caracteristica VALUES (1564, 220, 73);
INSERT INTO producto_caracteristica VALUES (1565, 220, 21);
INSERT INTO producto_caracteristica VALUES (1566, 220, 75);
INSERT INTO producto_caracteristica VALUES (1567, 220, 92);
INSERT INTO producto_caracteristica VALUES (1568, 220, 343);
INSERT INTO producto_caracteristica VALUES (1569, 220, 342);
INSERT INTO producto_caracteristica VALUES (1570, 220, 5);
INSERT INTO producto_caracteristica VALUES (1571, 221, 73);
INSERT INTO producto_caracteristica VALUES (1572, 221, 33);
INSERT INTO producto_caracteristica VALUES (1573, 221, 75);
INSERT INTO producto_caracteristica VALUES (1574, 221, 92);
INSERT INTO producto_caracteristica VALUES (1575, 221, 345);
INSERT INTO producto_caracteristica VALUES (1576, 221, 344);
INSERT INTO producto_caracteristica VALUES (1577, 221, 5);
INSERT INTO producto_caracteristica VALUES (1578, 222, 141);
INSERT INTO producto_caracteristica VALUES (1579, 222, 40);
INSERT INTO producto_caracteristica VALUES (1580, 222, 75);
INSERT INTO producto_caracteristica VALUES (1581, 222, 83);
INSERT INTO producto_caracteristica VALUES (1582, 222, 107);
INSERT INTO producto_caracteristica VALUES (1583, 222, 346);
INSERT INTO producto_caracteristica VALUES (1584, 222, 5);
INSERT INTO producto_caracteristica VALUES (1585, 223, 141);
INSERT INTO producto_caracteristica VALUES (1586, 223, 9);
INSERT INTO producto_caracteristica VALUES (1587, 223, 79);
INSERT INTO producto_caracteristica VALUES (1588, 223, 84);
INSERT INTO producto_caracteristica VALUES (1589, 223, 273);
INSERT INTO producto_caracteristica VALUES (1590, 223, 347);
INSERT INTO producto_caracteristica VALUES (1591, 223, 6);
INSERT INTO producto_caracteristica VALUES (1592, 224, 141);
INSERT INTO producto_caracteristica VALUES (1593, 224, 53);
INSERT INTO producto_caracteristica VALUES (1594, 224, 75);
INSERT INTO producto_caracteristica VALUES (1595, 224, 93);
INSERT INTO producto_caracteristica VALUES (1596, 224, 273);
INSERT INTO producto_caracteristica VALUES (1597, 224, 348);
INSERT INTO producto_caracteristica VALUES (1598, 224, 5);
INSERT INTO producto_caracteristica VALUES (1599, 225, 141);
INSERT INTO producto_caracteristica VALUES (1600, 225, 31);
INSERT INTO producto_caracteristica VALUES (1601, 225, 75);
INSERT INTO producto_caracteristica VALUES (1602, 225, 84);
INSERT INTO producto_caracteristica VALUES (1603, 225, 290);
INSERT INTO producto_caracteristica VALUES (1604, 225, 349);
INSERT INTO producto_caracteristica VALUES (1605, 225, 5);
INSERT INTO producto_caracteristica VALUES (1606, 226, 141);
INSERT INTO producto_caracteristica VALUES (1607, 226, 53);
INSERT INTO producto_caracteristica VALUES (1608, 226, 75);
INSERT INTO producto_caracteristica VALUES (1609, 226, 84);
INSERT INTO producto_caracteristica VALUES (1610, 226, 112);
INSERT INTO producto_caracteristica VALUES (1611, 226, 350);
INSERT INTO producto_caracteristica VALUES (1612, 226, 5);
INSERT INTO producto_caracteristica VALUES (1613, 227, 73);
INSERT INTO producto_caracteristica VALUES (1614, 227, 31);
INSERT INTO producto_caracteristica VALUES (1615, 227, 75);
INSERT INTO producto_caracteristica VALUES (1616, 227, 92);
INSERT INTO producto_caracteristica VALUES (1617, 227, 107);
INSERT INTO producto_caracteristica VALUES (1618, 227, 351);
INSERT INTO producto_caracteristica VALUES (1619, 227, 6);
INSERT INTO producto_caracteristica VALUES (1620, 228, 141);
INSERT INTO producto_caracteristica VALUES (1621, 228, 20);
INSERT INTO producto_caracteristica VALUES (1622, 228, 76);
INSERT INTO producto_caracteristica VALUES (1623, 228, 84);
INSERT INTO producto_caracteristica VALUES (1624, 228, 107);
INSERT INTO producto_caracteristica VALUES (1625, 228, 352);
INSERT INTO producto_caracteristica VALUES (1626, 228, 5);
INSERT INTO producto_caracteristica VALUES (1627, 229, 141);
INSERT INTO producto_caracteristica VALUES (1628, 229, 354);
INSERT INTO producto_caracteristica VALUES (1629, 229, 75);
INSERT INTO producto_caracteristica VALUES (1630, 229, 88);
INSERT INTO producto_caracteristica VALUES (1631, 229, 107);
INSERT INTO producto_caracteristica VALUES (1632, 229, 353);
INSERT INTO producto_caracteristica VALUES (1633, 229, 5);
INSERT INTO producto_caracteristica VALUES (1634, 230, 73);
INSERT INTO producto_caracteristica VALUES (1635, 230, 35);
INSERT INTO producto_caracteristica VALUES (1636, 230, 76);
INSERT INTO producto_caracteristica VALUES (1637, 230, 190);
INSERT INTO producto_caracteristica VALUES (1638, 230, 107);
INSERT INTO producto_caracteristica VALUES (1639, 230, 355);
INSERT INTO producto_caracteristica VALUES (1640, 230, 5);
INSERT INTO producto_caracteristica VALUES (1641, 231, 73);
INSERT INTO producto_caracteristica VALUES (1642, 231, 9);
INSERT INTO producto_caracteristica VALUES (1643, 231, 76);
INSERT INTO producto_caracteristica VALUES (1644, 231, 190);
INSERT INTO producto_caracteristica VALUES (1645, 231, 107);
INSERT INTO producto_caracteristica VALUES (1646, 231, 355);
INSERT INTO producto_caracteristica VALUES (1647, 231, 5);
INSERT INTO producto_caracteristica VALUES (1648, 232, 73);
INSERT INTO producto_caracteristica VALUES (1649, 232, 22);
INSERT INTO producto_caracteristica VALUES (1650, 232, 75);
INSERT INTO producto_caracteristica VALUES (1651, 232, 93);
INSERT INTO producto_caracteristica VALUES (1652, 232, 264);
INSERT INTO producto_caracteristica VALUES (1653, 232, 356);
INSERT INTO producto_caracteristica VALUES (1654, 232, 5);
INSERT INTO producto_caracteristica VALUES (1655, 233, 73);
INSERT INTO producto_caracteristica VALUES (1656, 233, 183);
INSERT INTO producto_caracteristica VALUES (1657, 233, 75);
INSERT INTO producto_caracteristica VALUES (1658, 233, 90);
INSERT INTO producto_caracteristica VALUES (1659, 233, 264);
INSERT INTO producto_caracteristica VALUES (1660, 233, 357);
INSERT INTO producto_caracteristica VALUES (1661, 233, 13);
INSERT INTO producto_caracteristica VALUES (1662, 234, 73);
INSERT INTO producto_caracteristica VALUES (1663, 234, 358);
INSERT INTO producto_caracteristica VALUES (1664, 234, 75);
INSERT INTO producto_caracteristica VALUES (1665, 234, 81);
INSERT INTO producto_caracteristica VALUES (1666, 234, 107);
INSERT INTO producto_caracteristica VALUES (1667, 234, 359);
INSERT INTO producto_caracteristica VALUES (1668, 234, 5);
INSERT INTO producto_caracteristica VALUES (1669, 235, 73);
INSERT INTO producto_caracteristica VALUES (1670, 235, 56);
INSERT INTO producto_caracteristica VALUES (1671, 235, 75);
INSERT INTO producto_caracteristica VALUES (1672, 235, 84);
INSERT INTO producto_caracteristica VALUES (1673, 235, 107);
INSERT INTO producto_caracteristica VALUES (1674, 235, 360);
INSERT INTO producto_caracteristica VALUES (1675, 235, 6);
INSERT INTO producto_caracteristica VALUES (1676, 236, 73);
INSERT INTO producto_caracteristica VALUES (1677, 236, 183);
INSERT INTO producto_caracteristica VALUES (1678, 236, 75);
INSERT INTO producto_caracteristica VALUES (1679, 236, 93);
INSERT INTO producto_caracteristica VALUES (1680, 236, 290);
INSERT INTO producto_caracteristica VALUES (1681, 236, 323);
INSERT INTO producto_caracteristica VALUES (1682, 236, 6);
INSERT INTO producto_caracteristica VALUES (1683, 237, 174);
INSERT INTO producto_caracteristica VALUES (1684, 237, 24);
INSERT INTO producto_caracteristica VALUES (1685, 237, 76);
INSERT INTO producto_caracteristica VALUES (1686, 237, 149);
INSERT INTO producto_caracteristica VALUES (1687, 237, 115);
INSERT INTO producto_caracteristica VALUES (1688, 237, 361);
INSERT INTO producto_caracteristica VALUES (1689, 237, 5);
INSERT INTO producto_caracteristica VALUES (1690, 238, 141);
INSERT INTO producto_caracteristica VALUES (1691, 238, 36);
INSERT INTO producto_caracteristica VALUES (1692, 238, 75);
INSERT INTO producto_caracteristica VALUES (1693, 238, 83);
INSERT INTO producto_caracteristica VALUES (1694, 238, 363);
INSERT INTO producto_caracteristica VALUES (1695, 238, 311);
INSERT INTO producto_caracteristica VALUES (1696, 238, 6);


--
-- Name: producto_caracteristica_idproducto_caracteristica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_caracteristica_idproducto_caracteristica_seq', 1696, true);


--
-- Name: producto_idproducto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_idproducto_seq', 238, true);


--
-- Data for Name: producto_unidadmedida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO producto_unidadmedida VALUES (2, 12, 1);
INSERT INTO producto_unidadmedida VALUES (3, 17, 1);
INSERT INTO producto_unidadmedida VALUES (4, 17, 2);
INSERT INTO producto_unidadmedida VALUES (5, 19, 1);
INSERT INTO producto_unidadmedida VALUES (6, 19, 2);
INSERT INTO producto_unidadmedida VALUES (7, 20, 1);
INSERT INTO producto_unidadmedida VALUES (8, 21, 1);
INSERT INTO producto_unidadmedida VALUES (9, 22, 1);
INSERT INTO producto_unidadmedida VALUES (10, 23, 1);
INSERT INTO producto_unidadmedida VALUES (11, 24, 1);
INSERT INTO producto_unidadmedida VALUES (12, 25, 1);
INSERT INTO producto_unidadmedida VALUES (13, 26, 1);
INSERT INTO producto_unidadmedida VALUES (14, 27, 1);
INSERT INTO producto_unidadmedida VALUES (15, 28, 1);
INSERT INTO producto_unidadmedida VALUES (16, 29, 1);
INSERT INTO producto_unidadmedida VALUES (17, 30, 1);
INSERT INTO producto_unidadmedida VALUES (18, 31, 1);
INSERT INTO producto_unidadmedida VALUES (19, 32, 1);
INSERT INTO producto_unidadmedida VALUES (20, 33, 1);
INSERT INTO producto_unidadmedida VALUES (21, 34, 1);
INSERT INTO producto_unidadmedida VALUES (22, 35, 1);
INSERT INTO producto_unidadmedida VALUES (23, 36, 1);
INSERT INTO producto_unidadmedida VALUES (24, 37, 1);
INSERT INTO producto_unidadmedida VALUES (25, 38, 1);
INSERT INTO producto_unidadmedida VALUES (26, 39, 1);
INSERT INTO producto_unidadmedida VALUES (27, 40, 1);
INSERT INTO producto_unidadmedida VALUES (28, 41, 1);
INSERT INTO producto_unidadmedida VALUES (29, 42, 1);
INSERT INTO producto_unidadmedida VALUES (30, 43, 1);
INSERT INTO producto_unidadmedida VALUES (31, 44, 1);
INSERT INTO producto_unidadmedida VALUES (32, 45, 1);
INSERT INTO producto_unidadmedida VALUES (33, 46, 1);
INSERT INTO producto_unidadmedida VALUES (34, 47, 1);
INSERT INTO producto_unidadmedida VALUES (35, 48, 1);
INSERT INTO producto_unidadmedida VALUES (36, 49, 1);
INSERT INTO producto_unidadmedida VALUES (37, 50, 1);
INSERT INTO producto_unidadmedida VALUES (38, 51, 1);
INSERT INTO producto_unidadmedida VALUES (39, 52, 1);
INSERT INTO producto_unidadmedida VALUES (40, 53, 1);
INSERT INTO producto_unidadmedida VALUES (41, 54, 1);
INSERT INTO producto_unidadmedida VALUES (42, 55, 1);
INSERT INTO producto_unidadmedida VALUES (43, 57, 1);
INSERT INTO producto_unidadmedida VALUES (44, 58, 1);
INSERT INTO producto_unidadmedida VALUES (45, 59, 1);
INSERT INTO producto_unidadmedida VALUES (46, 60, 1);
INSERT INTO producto_unidadmedida VALUES (47, 61, 1);
INSERT INTO producto_unidadmedida VALUES (48, 62, 1);
INSERT INTO producto_unidadmedida VALUES (49, 63, 1);
INSERT INTO producto_unidadmedida VALUES (50, 64, 1);
INSERT INTO producto_unidadmedida VALUES (51, 65, 1);
INSERT INTO producto_unidadmedida VALUES (52, 66, 1);
INSERT INTO producto_unidadmedida VALUES (53, 67, 1);
INSERT INTO producto_unidadmedida VALUES (54, 68, 1);
INSERT INTO producto_unidadmedida VALUES (55, 69, 1);
INSERT INTO producto_unidadmedida VALUES (56, 70, 1);
INSERT INTO producto_unidadmedida VALUES (57, 71, 1);
INSERT INTO producto_unidadmedida VALUES (58, 72, 1);
INSERT INTO producto_unidadmedida VALUES (59, 73, 1);
INSERT INTO producto_unidadmedida VALUES (60, 74, 1);
INSERT INTO producto_unidadmedida VALUES (61, 75, 1);
INSERT INTO producto_unidadmedida VALUES (62, 76, 1);
INSERT INTO producto_unidadmedida VALUES (63, 77, 1);
INSERT INTO producto_unidadmedida VALUES (64, 78, 1);
INSERT INTO producto_unidadmedida VALUES (65, 79, 1);
INSERT INTO producto_unidadmedida VALUES (66, 80, 1);
INSERT INTO producto_unidadmedida VALUES (67, 81, 1);
INSERT INTO producto_unidadmedida VALUES (68, 82, 1);
INSERT INTO producto_unidadmedida VALUES (69, 83, 1);
INSERT INTO producto_unidadmedida VALUES (70, 84, 1);
INSERT INTO producto_unidadmedida VALUES (71, 85, 1);
INSERT INTO producto_unidadmedida VALUES (72, 86, 1);
INSERT INTO producto_unidadmedida VALUES (73, 87, 1);
INSERT INTO producto_unidadmedida VALUES (74, 88, 1);
INSERT INTO producto_unidadmedida VALUES (75, 89, 1);
INSERT INTO producto_unidadmedida VALUES (76, 90, 1);
INSERT INTO producto_unidadmedida VALUES (77, 91, 1);
INSERT INTO producto_unidadmedida VALUES (78, 92, 1);
INSERT INTO producto_unidadmedida VALUES (79, 93, 1);
INSERT INTO producto_unidadmedida VALUES (80, 94, 1);
INSERT INTO producto_unidadmedida VALUES (81, 95, 1);
INSERT INTO producto_unidadmedida VALUES (82, 96, 1);
INSERT INTO producto_unidadmedida VALUES (83, 97, 1);
INSERT INTO producto_unidadmedida VALUES (84, 98, 1);
INSERT INTO producto_unidadmedida VALUES (85, 99, 1);
INSERT INTO producto_unidadmedida VALUES (86, 100, 1);
INSERT INTO producto_unidadmedida VALUES (87, 101, 1);
INSERT INTO producto_unidadmedida VALUES (88, 102, 1);
INSERT INTO producto_unidadmedida VALUES (89, 103, 1);
INSERT INTO producto_unidadmedida VALUES (90, 104, 1);
INSERT INTO producto_unidadmedida VALUES (91, 105, 1);
INSERT INTO producto_unidadmedida VALUES (92, 106, 1);
INSERT INTO producto_unidadmedida VALUES (93, 107, 1);
INSERT INTO producto_unidadmedida VALUES (94, 108, 1);
INSERT INTO producto_unidadmedida VALUES (95, 109, 1);
INSERT INTO producto_unidadmedida VALUES (96, 110, 1);
INSERT INTO producto_unidadmedida VALUES (97, 111, 1);
INSERT INTO producto_unidadmedida VALUES (98, 112, 1);
INSERT INTO producto_unidadmedida VALUES (99, 113, 1);
INSERT INTO producto_unidadmedida VALUES (100, 114, 1);
INSERT INTO producto_unidadmedida VALUES (101, 115, 1);
INSERT INTO producto_unidadmedida VALUES (102, 116, 1);
INSERT INTO producto_unidadmedida VALUES (103, 117, 1);
INSERT INTO producto_unidadmedida VALUES (104, 118, 1);
INSERT INTO producto_unidadmedida VALUES (105, 119, 1);
INSERT INTO producto_unidadmedida VALUES (106, 120, 1);
INSERT INTO producto_unidadmedida VALUES (107, 121, 1);
INSERT INTO producto_unidadmedida VALUES (108, 122, 1);
INSERT INTO producto_unidadmedida VALUES (109, 123, 1);
INSERT INTO producto_unidadmedida VALUES (110, 124, 1);
INSERT INTO producto_unidadmedida VALUES (111, 125, 1);
INSERT INTO producto_unidadmedida VALUES (112, 126, 1);
INSERT INTO producto_unidadmedida VALUES (113, 127, 1);
INSERT INTO producto_unidadmedida VALUES (114, 128, 1);
INSERT INTO producto_unidadmedida VALUES (115, 129, 1);
INSERT INTO producto_unidadmedida VALUES (116, 130, 1);
INSERT INTO producto_unidadmedida VALUES (117, 131, 1);
INSERT INTO producto_unidadmedida VALUES (118, 132, 1);
INSERT INTO producto_unidadmedida VALUES (119, 133, 1);
INSERT INTO producto_unidadmedida VALUES (120, 134, 1);
INSERT INTO producto_unidadmedida VALUES (121, 135, 1);
INSERT INTO producto_unidadmedida VALUES (122, 136, 1);
INSERT INTO producto_unidadmedida VALUES (123, 137, 1);
INSERT INTO producto_unidadmedida VALUES (124, 138, 1);
INSERT INTO producto_unidadmedida VALUES (125, 139, 1);
INSERT INTO producto_unidadmedida VALUES (126, 140, 1);
INSERT INTO producto_unidadmedida VALUES (127, 141, 1);
INSERT INTO producto_unidadmedida VALUES (128, 142, 1);
INSERT INTO producto_unidadmedida VALUES (129, 143, 1);
INSERT INTO producto_unidadmedida VALUES (130, 144, 1);
INSERT INTO producto_unidadmedida VALUES (131, 145, 1);
INSERT INTO producto_unidadmedida VALUES (132, 146, 1);
INSERT INTO producto_unidadmedida VALUES (133, 147, 1);
INSERT INTO producto_unidadmedida VALUES (134, 148, 1);
INSERT INTO producto_unidadmedida VALUES (135, 149, 1);
INSERT INTO producto_unidadmedida VALUES (136, 150, 1);
INSERT INTO producto_unidadmedida VALUES (137, 151, 1);
INSERT INTO producto_unidadmedida VALUES (138, 152, 1);
INSERT INTO producto_unidadmedida VALUES (139, 153, 1);
INSERT INTO producto_unidadmedida VALUES (140, 154, 1);
INSERT INTO producto_unidadmedida VALUES (141, 155, 1);
INSERT INTO producto_unidadmedida VALUES (142, 156, 1);
INSERT INTO producto_unidadmedida VALUES (143, 157, 1);
INSERT INTO producto_unidadmedida VALUES (144, 158, 1);
INSERT INTO producto_unidadmedida VALUES (145, 159, 1);
INSERT INTO producto_unidadmedida VALUES (146, 160, 1);
INSERT INTO producto_unidadmedida VALUES (147, 161, 1);
INSERT INTO producto_unidadmedida VALUES (148, 162, 1);
INSERT INTO producto_unidadmedida VALUES (149, 163, 1);
INSERT INTO producto_unidadmedida VALUES (150, 164, 1);
INSERT INTO producto_unidadmedida VALUES (151, 165, 1);
INSERT INTO producto_unidadmedida VALUES (152, 166, 1);
INSERT INTO producto_unidadmedida VALUES (153, 167, 1);
INSERT INTO producto_unidadmedida VALUES (154, 168, 1);
INSERT INTO producto_unidadmedida VALUES (155, 169, 1);
INSERT INTO producto_unidadmedida VALUES (156, 170, 1);
INSERT INTO producto_unidadmedida VALUES (157, 171, 1);
INSERT INTO producto_unidadmedida VALUES (158, 172, 1);
INSERT INTO producto_unidadmedida VALUES (159, 173, 1);
INSERT INTO producto_unidadmedida VALUES (160, 174, 1);
INSERT INTO producto_unidadmedida VALUES (161, 175, 1);
INSERT INTO producto_unidadmedida VALUES (162, 176, 1);
INSERT INTO producto_unidadmedida VALUES (163, 177, 1);
INSERT INTO producto_unidadmedida VALUES (164, 178, 1);
INSERT INTO producto_unidadmedida VALUES (165, 179, 1);
INSERT INTO producto_unidadmedida VALUES (166, 180, 1);
INSERT INTO producto_unidadmedida VALUES (167, 181, 1);
INSERT INTO producto_unidadmedida VALUES (168, 182, 1);
INSERT INTO producto_unidadmedida VALUES (169, 183, 1);
INSERT INTO producto_unidadmedida VALUES (170, 184, 1);
INSERT INTO producto_unidadmedida VALUES (171, 185, 1);
INSERT INTO producto_unidadmedida VALUES (172, 186, 1);
INSERT INTO producto_unidadmedida VALUES (173, 187, 1);
INSERT INTO producto_unidadmedida VALUES (174, 188, 1);
INSERT INTO producto_unidadmedida VALUES (175, 189, 1);
INSERT INTO producto_unidadmedida VALUES (176, 190, 1);
INSERT INTO producto_unidadmedida VALUES (177, 191, 1);
INSERT INTO producto_unidadmedida VALUES (178, 192, 1);
INSERT INTO producto_unidadmedida VALUES (179, 193, 1);
INSERT INTO producto_unidadmedida VALUES (180, 194, 1);
INSERT INTO producto_unidadmedida VALUES (181, 195, 1);
INSERT INTO producto_unidadmedida VALUES (182, 196, 1);
INSERT INTO producto_unidadmedida VALUES (183, 197, 1);
INSERT INTO producto_unidadmedida VALUES (184, 198, 1);
INSERT INTO producto_unidadmedida VALUES (185, 199, 1);
INSERT INTO producto_unidadmedida VALUES (186, 200, 1);
INSERT INTO producto_unidadmedida VALUES (187, 201, 1);
INSERT INTO producto_unidadmedida VALUES (188, 202, 1);
INSERT INTO producto_unidadmedida VALUES (189, 203, 1);
INSERT INTO producto_unidadmedida VALUES (190, 204, 1);
INSERT INTO producto_unidadmedida VALUES (191, 205, 1);
INSERT INTO producto_unidadmedida VALUES (192, 206, 1);
INSERT INTO producto_unidadmedida VALUES (193, 207, 1);
INSERT INTO producto_unidadmedida VALUES (194, 208, 1);
INSERT INTO producto_unidadmedida VALUES (195, 209, 1);
INSERT INTO producto_unidadmedida VALUES (196, 210, 1);
INSERT INTO producto_unidadmedida VALUES (197, 211, 1);
INSERT INTO producto_unidadmedida VALUES (198, 212, 1);
INSERT INTO producto_unidadmedida VALUES (199, 213, 1);
INSERT INTO producto_unidadmedida VALUES (200, 214, 1);
INSERT INTO producto_unidadmedida VALUES (201, 215, 1);
INSERT INTO producto_unidadmedida VALUES (202, 216, 1);
INSERT INTO producto_unidadmedida VALUES (203, 217, 1);
INSERT INTO producto_unidadmedida VALUES (204, 218, 1);
INSERT INTO producto_unidadmedida VALUES (205, 219, 1);
INSERT INTO producto_unidadmedida VALUES (206, 220, 1);
INSERT INTO producto_unidadmedida VALUES (207, 221, 1);
INSERT INTO producto_unidadmedida VALUES (208, 222, 1);
INSERT INTO producto_unidadmedida VALUES (209, 223, 1);
INSERT INTO producto_unidadmedida VALUES (210, 224, 1);
INSERT INTO producto_unidadmedida VALUES (211, 225, 1);
INSERT INTO producto_unidadmedida VALUES (212, 226, 1);
INSERT INTO producto_unidadmedida VALUES (213, 227, 1);
INSERT INTO producto_unidadmedida VALUES (214, 228, 1);
INSERT INTO producto_unidadmedida VALUES (215, 229, 1);
INSERT INTO producto_unidadmedida VALUES (216, 230, 1);
INSERT INTO producto_unidadmedida VALUES (217, 231, 1);
INSERT INTO producto_unidadmedida VALUES (218, 232, 1);
INSERT INTO producto_unidadmedida VALUES (219, 233, 1);
INSERT INTO producto_unidadmedida VALUES (220, 234, 1);
INSERT INTO producto_unidadmedida VALUES (221, 235, 1);
INSERT INTO producto_unidadmedida VALUES (222, 236, 1);
INSERT INTO producto_unidadmedida VALUES (223, 237, 1);
INSERT INTO producto_unidadmedida VALUES (224, 238, 1);


--
-- Name: producto_unidadmedida_id_producto_unidadmedida_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('producto_unidadmedida_id_producto_unidadmedida_seq', 224, true);


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO productos VALUES (11, 'polo adidas', 2, 1, '1', 1, '2017-09-24 19:59:31');
INSERT INTO productos VALUES (103, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-19 00:41:06');
INSERT INTO productos VALUES (104, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-19 00:44:41');
INSERT INTO productos VALUES (12, 'BLUSA 3/4', 66, 14, '1', 3, '2017-12-09 17:48:31');
INSERT INTO productos VALUES (19, 'BLUSA 3/4', 66, 14, '1', 3, '2017-12-09 18:03:25');
INSERT INTO productos VALUES (20, 'BLUSA 3/4', 66, 14, '1', 3, '2017-12-09 18:06:33');
INSERT INTO productos VALUES (21, 'BLUSA 3/4', 66, 14, '1', 3, '2017-12-09 18:08:37');
INSERT INTO productos VALUES (22, 'BLUSA 3/4', 66, 14, '1', 3, '2017-12-09 18:12:48');
INSERT INTO productos VALUES (23, 'BLUSA 3/4', 66, 14, '1', 3, '2017-12-09 18:16:40');
INSERT INTO productos VALUES (24, 'BLUSA 3/4', 66, 15, '1', 3, '2017-12-09 18:26:47');
INSERT INTO productos VALUES (25, 'BLUSA 3/4', 66, 15, '1', 3, '2017-12-09 18:28:07');
INSERT INTO productos VALUES (26, 'BLUSA 3/4', 66, 15, '1', 3, '2017-12-09 18:30:48');
INSERT INTO productos VALUES (27, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-09 18:36:12');
INSERT INTO productos VALUES (28, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-09 18:39:57');
INSERT INTO productos VALUES (29, 'BLUSA 3/4', 66, 8, '1', 3, '2017-12-09 18:49:22');
INSERT INTO productos VALUES (30, 'BLUSA 3/4', 66, 8, '1', 3, '2017-12-09 18:53:00');
INSERT INTO productos VALUES (31, 'BLUSA 3/4', 66, 8, '1', 3, '2017-12-09 18:58:34');
INSERT INTO productos VALUES (32, 'BLUSA 3/4', 66, 8, '1', 3, '2017-12-09 19:00:07');
INSERT INTO productos VALUES (33, 'BLUSA 3/4', 66, 8, '1', 3, '2017-12-09 19:04:22');
INSERT INTO productos VALUES (34, 'BLUSA 3/4', 66, 16, '1', 3, '2017-12-09 19:12:49');
INSERT INTO productos VALUES (35, 'BLUSA 3/4', 66, 17, '1', 3, '2017-12-09 19:18:52');
INSERT INTO productos VALUES (36, 'BLUSA 3/4', 66, 18, '1', 3, '2017-12-09 19:23:35');
INSERT INTO productos VALUES (37, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:11:44');
INSERT INTO productos VALUES (38, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:15:47');
INSERT INTO productos VALUES (39, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:21:54');
INSERT INTO productos VALUES (40, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:25:15');
INSERT INTO productos VALUES (41, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:27:11');
INSERT INTO productos VALUES (42, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:33:52');
INSERT INTO productos VALUES (43, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:38:11');
INSERT INTO productos VALUES (44, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:40:01');
INSERT INTO productos VALUES (45, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:43:19');
INSERT INTO productos VALUES (46, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:45:27');
INSERT INTO productos VALUES (47, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:49:40');
INSERT INTO productos VALUES (48, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:52:06');
INSERT INTO productos VALUES (49, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:54:19');
INSERT INTO productos VALUES (50, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:56:16');
INSERT INTO productos VALUES (51, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-15 00:58:04');
INSERT INTO productos VALUES (52, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:00:09');
INSERT INTO productos VALUES (53, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:02:13');
INSERT INTO productos VALUES (54, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:06:08');
INSERT INTO productos VALUES (55, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:08:07');
INSERT INTO productos VALUES (56, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:10:29');
INSERT INTO productos VALUES (58, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:24:20');
INSERT INTO productos VALUES (57, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:24:50');
INSERT INTO productos VALUES (59, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:26:52');
INSERT INTO productos VALUES (60, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:28:42');
INSERT INTO productos VALUES (61, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:32:24');
INSERT INTO productos VALUES (62, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:35:53');
INSERT INTO productos VALUES (63, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:37:55');
INSERT INTO productos VALUES (64, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:40:44');
INSERT INTO productos VALUES (65, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:43:14');
INSERT INTO productos VALUES (66, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:47:01');
INSERT INTO productos VALUES (67, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:49:48');
INSERT INTO productos VALUES (68, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 00:51:38');
INSERT INTO productos VALUES (71, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 01:02:53');
INSERT INTO productos VALUES (70, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 01:03:24');
INSERT INTO productos VALUES (69, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 01:03:45');
INSERT INTO productos VALUES (72, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 17:48:03');
INSERT INTO productos VALUES (73, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-16 17:51:41');
INSERT INTO productos VALUES (74, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 17:56:50');
INSERT INTO productos VALUES (75, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:01:46');
INSERT INTO productos VALUES (76, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:05:25');
INSERT INTO productos VALUES (77, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:12:50');
INSERT INTO productos VALUES (78, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:15:29');
INSERT INTO productos VALUES (79, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:20:23');
INSERT INTO productos VALUES (80, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:32:49');
INSERT INTO productos VALUES (81, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:35:28');
INSERT INTO productos VALUES (82, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:41:47');
INSERT INTO productos VALUES (83, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:45:23');
INSERT INTO productos VALUES (84, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:47:49');
INSERT INTO productos VALUES (85, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-16 18:50:53');
INSERT INTO productos VALUES (86, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-16 18:56:36');
INSERT INTO productos VALUES (107, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-03 23:59:56');
INSERT INTO productos VALUES (89, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-18 23:48:35');
INSERT INTO productos VALUES (108, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-04 00:05:21');
INSERT INTO productos VALUES (87, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-18 23:50:21');
INSERT INTO productos VALUES (88, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-18 23:50:43');
INSERT INTO productos VALUES (90, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-18 23:57:36');
INSERT INTO productos VALUES (91, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-18 23:58:51');
INSERT INTO productos VALUES (92, 'BLUSA 3/4', 66, 11, '1', 3, '2017-12-19 00:07:36');
INSERT INTO productos VALUES (93, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-19 00:10:10');
INSERT INTO productos VALUES (94, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-19 00:13:35');
INSERT INTO productos VALUES (95, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-19 00:15:27');
INSERT INTO productos VALUES (96, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-19 00:19:16');
INSERT INTO productos VALUES (97, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-19 00:23:06');
INSERT INTO productos VALUES (98, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-19 00:25:02');
INSERT INTO productos VALUES (99, 'BLUSA 3/4', 66, 10, '1', 3, '2017-12-19 00:29:23');
INSERT INTO productos VALUES (100, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-19 00:33:05');
INSERT INTO productos VALUES (101, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-19 00:36:32');
INSERT INTO productos VALUES (102, 'BLUSA 3/4', 66, 13, '1', 3, '2017-12-19 00:39:01');
INSERT INTO productos VALUES (109, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-04 00:13:00');
INSERT INTO productos VALUES (110, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-04 00:16:58');
INSERT INTO productos VALUES (112, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 10, '1', 3, '2018-01-04 00:34:35');
INSERT INTO productos VALUES (111, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 10, '1', 3, '2018-01-04 00:35:13');
INSERT INTO productos VALUES (113, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-04 00:50:55');
INSERT INTO productos VALUES (106, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-04 07:28:29');
INSERT INTO productos VALUES (117, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-04 23:49:21');
INSERT INTO productos VALUES (105, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-04 07:32:18');
INSERT INTO productos VALUES (115, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '0', 3, '2018-01-04 23:40:21');
INSERT INTO productos VALUES (116, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-04 23:46:20');
INSERT INTO productos VALUES (118, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-04 23:52:41');
INSERT INTO productos VALUES (119, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-04 23:56:37');
INSERT INTO productos VALUES (120, 'BLUSA M/C', 66, 9, '1', 3, '2018-01-05 00:02:49');
INSERT INTO productos VALUES (121, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:06:52');
INSERT INTO productos VALUES (122, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:10:39');
INSERT INTO productos VALUES (123, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-05 00:14:36');
INSERT INTO productos VALUES (124, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:21:04');
INSERT INTO productos VALUES (125, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:28:11');
INSERT INTO productos VALUES (126, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:32:34');
INSERT INTO productos VALUES (127, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-05 00:36:46');
INSERT INTO productos VALUES (128, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 13, '1', 3, '2018-01-05 00:40:55');
INSERT INTO productos VALUES (129, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:43:43');
INSERT INTO productos VALUES (130, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-05 00:49:31');
INSERT INTO productos VALUES (131, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-05 00:53:38');
INSERT INTO productos VALUES (132, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-10 22:52:58');
INSERT INTO productos VALUES (134, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-10 23:02:18');
INSERT INTO productos VALUES (135, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-10 23:04:48');
INSERT INTO productos VALUES (136, 'BLUSA M/C', 66, 10, '1', 3, '2018-01-10 23:08:39');
INSERT INTO productos VALUES (137, 'BLUSA M/C', 66, 10, '1', 3, '2018-01-10 23:12:31');
INSERT INTO productos VALUES (138, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-10 23:28:22');
INSERT INTO productos VALUES (139, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-10 23:36:56');
INSERT INTO productos VALUES (140, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-10 23:41:54');
INSERT INTO productos VALUES (141, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-10 23:49:51');
INSERT INTO productos VALUES (142, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-10 23:53:39');
INSERT INTO productos VALUES (143, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-11 00:07:44');
INSERT INTO productos VALUES (144, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-11 00:10:20');
INSERT INTO productos VALUES (145, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-11 00:14:59');
INSERT INTO productos VALUES (146, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-11 00:16:51');
INSERT INTO productos VALUES (148, 'BLUSA M/C DE HOMBRO CAIDO', 66, 8, '1', 3, '2018-01-11 00:26:05');
INSERT INTO productos VALUES (149, 'BLUSA M/C DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-11 00:28:16');
INSERT INTO productos VALUES (150, 'BLUSA M/C DE HOMBRO CAIDO', 66, 13, '1', 3, '2018-01-11 00:33:00');
INSERT INTO productos VALUES (151, 'BLUSA M/C DE HOMBRO CAIDO', 66, 13, '1', 3, '2018-01-11 00:42:46');
INSERT INTO productos VALUES (152, 'BLUSA 3/4 DE HOMBRO CAIDO', 66, 10, '1', 3, '2018-01-11 00:46:21');
INSERT INTO productos VALUES (155, 'BLUSA M/C DE HOMBRO CAIDO', 66, 8, '1', 3, '2018-01-11 00:52:45');
INSERT INTO productos VALUES (154, 'BLUSA M/C DE HOMBRO CAIDO', 66, 8, '1', 3, '2018-01-12 00:02:57');
INSERT INTO productos VALUES (156, 'BLUSA M/C DE HOMBRO CAIDO', 66, 8, '1', 3, '2018-01-12 00:09:14');
INSERT INTO productos VALUES (157, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-12 00:19:04');
INSERT INTO productos VALUES (158, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-12 00:27:06');
INSERT INTO productos VALUES (159, 'POLO M/C DE HOMBRO CAIDO', 63, 11, '1', 3, '2018-01-12 00:32:44');
INSERT INTO productos VALUES (160, 'BLUSA M/C', 66, 10, '1', 3, '2018-01-12 00:38:54');
INSERT INTO productos VALUES (161, 'BLUSA M/C', 66, 10, '1', 3, '2018-01-12 00:40:38');
INSERT INTO productos VALUES (162, 'POLO M/C DE HOMBRO CAIDO', 63, 11, '1', 3, '2018-01-12 00:42:50');
INSERT INTO productos VALUES (163, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-12 00:46:32');
INSERT INTO productos VALUES (164, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-12 23:42:16');
INSERT INTO productos VALUES (165, 'BLUSA M/C', 66, 17, '1', 3, '2018-01-12 23:53:24');
INSERT INTO productos VALUES (166, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-12 23:58:00');
INSERT INTO productos VALUES (167, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:01:00');
INSERT INTO productos VALUES (168, 'BLUSA M/C DE HOMBRO CAIDO', 66, 10, '1', 3, '2018-01-13 00:04:45');
INSERT INTO productos VALUES (169, 'BLUSA M/C DE HOMBRO CAIDO', 66, 10, '1', 3, '2018-01-13 00:07:29');
INSERT INTO productos VALUES (170, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:11:39');
INSERT INTO productos VALUES (171, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:20:16');
INSERT INTO productos VALUES (172, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:27:10');
INSERT INTO productos VALUES (173, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:30:04');
INSERT INTO productos VALUES (174, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:35:54');
INSERT INTO productos VALUES (175, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:40:21');
INSERT INTO productos VALUES (176, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:43:36');
INSERT INTO productos VALUES (177, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:48:16');
INSERT INTO productos VALUES (178, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:50:53');
INSERT INTO productos VALUES (179, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-13 00:53:32');
INSERT INTO productos VALUES (180, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-16 23:52:56');
INSERT INTO productos VALUES (181, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-17 00:02:18');
INSERT INTO productos VALUES (182, 'BLUSA M/0', 66, 8, '1', 3, '2018-01-17 00:05:08');
INSERT INTO productos VALUES (183, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:09:54');
INSERT INTO productos VALUES (184, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-17 00:12:44');
INSERT INTO productos VALUES (185, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:16:31');
INSERT INTO productos VALUES (186, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:20:36');
INSERT INTO productos VALUES (187, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:23:38');
INSERT INTO productos VALUES (188, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:25:13');
INSERT INTO productos VALUES (189, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:31:11');
INSERT INTO productos VALUES (190, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:35:28');
INSERT INTO productos VALUES (191, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:38:32');
INSERT INTO productos VALUES (192, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:40:23');
INSERT INTO productos VALUES (193, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 00:43:08');
INSERT INTO productos VALUES (194, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-17 00:52:28');
INSERT INTO productos VALUES (195, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-17 00:54:05');
INSERT INTO productos VALUES (196, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-17 00:56:37');
INSERT INTO productos VALUES (197, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 01:00:13');
INSERT INTO productos VALUES (198, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-17 01:01:43');
INSERT INTO productos VALUES (199, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-18 00:03:52');
INSERT INTO productos VALUES (200, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-18 00:09:45');
INSERT INTO productos VALUES (201, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-18 00:11:45');
INSERT INTO productos VALUES (202, 'BLUSA M/C DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-18 00:16:50');
INSERT INTO productos VALUES (203, 'BLUSA M/C DE HOMBRO CAIDO', 66, 11, '1', 3, '2018-01-18 00:24:39');
INSERT INTO productos VALUES (204, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-18 00:29:30');
INSERT INTO productos VALUES (205, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-18 00:30:59');
INSERT INTO productos VALUES (206, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-18 00:35:37');
INSERT INTO productos VALUES (207, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-18 00:37:42');
INSERT INTO productos VALUES (208, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-18 00:46:43');
INSERT INTO productos VALUES (209, 'BLUSA M/C', 66, 11, '1', 3, '2018-01-18 00:48:24');
INSERT INTO productos VALUES (210, 'BLUSA M/C', 66, 10, '1', 3, '2018-01-18 00:50:48');
INSERT INTO productos VALUES (211, 'BLUSA M/C', 66, 10, '1', 3, '2018-01-18 00:52:38');
INSERT INTO productos VALUES (212, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-18 00:55:21');
INSERT INTO productos VALUES (213, 'BLUSA M/0', 66, 13, '1', 3, '2018-01-23 23:28:44');
INSERT INTO productos VALUES (214, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-23 23:32:21');
INSERT INTO productos VALUES (215, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-23 23:34:00');
INSERT INTO productos VALUES (216, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-23 23:36:31');
INSERT INTO productos VALUES (217, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-23 23:39:40');
INSERT INTO productos VALUES (218, 'BLUSA M/C', 66, 8, '1', 3, '2018-01-23 23:41:12');
INSERT INTO productos VALUES (219, 'POLO M/C ', 63, 13, '1', 3, '2018-01-23 23:45:58');
INSERT INTO productos VALUES (220, 'POLO M/C ', 63, 13, '1', 3, '2018-01-23 23:50:05');
INSERT INTO productos VALUES (221, 'POLO M/C ', 63, 13, '1', 3, '2018-01-23 23:53:49');
INSERT INTO productos VALUES (222, 'POLO M/C ', 63, 14, '1', 3, '2018-01-23 23:56:55');
INSERT INTO productos VALUES (223, 'POLO M/C ', 63, 14, '1', 3, '2018-01-24 00:00:22');
INSERT INTO productos VALUES (224, 'POLO M/C ', 63, 14, '1', 3, '2018-01-24 00:02:58');
INSERT INTO productos VALUES (225, 'POLO M/C ', 63, 14, '1', 3, '2018-01-24 00:06:46');
INSERT INTO productos VALUES (226, 'POLO M/C ', 63, 14, '1', 3, '2018-01-24 00:09:52');
INSERT INTO productos VALUES (227, 'POLO M/C ', 63, 13, '1', 3, '2018-01-24 00:13:29');
INSERT INTO productos VALUES (228, 'POLO M/C ', 63, 14, '1', 3, '2018-01-24 00:15:46');
INSERT INTO productos VALUES (229, 'POLO M/C ', 63, 14, '1', 3, '2018-01-24 00:18:24');
INSERT INTO productos VALUES (230, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-24 00:22:23');
INSERT INTO productos VALUES (231, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-24 00:24:38');
INSERT INTO productos VALUES (232, 'POLO M/C ', 63, 13, '1', 3, '2018-01-24 00:26:53');
INSERT INTO productos VALUES (233, 'POLO M/C ', 63, 13, '1', 3, '2018-01-24 00:29:13');
INSERT INTO productos VALUES (234, 'POLO M/C ', 63, 13, '1', 3, '2018-01-24 00:35:28');
INSERT INTO productos VALUES (235, 'POLO M/C ', 63, 13, '1', 3, '2018-01-24 00:39:56');
INSERT INTO productos VALUES (236, 'BLUSA M/C', 66, 13, '1', 3, '2018-01-24 00:44:33');
INSERT INTO productos VALUES (237, 'BLUSA M/C', 66, 17, '1', 3, '2018-01-24 00:50:36');
INSERT INTO productos VALUES (238, 'BLUSA M/C', 66, 14, '1', 3, '2018-01-24 00:55:37');


--
-- Data for Name: sucursal; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sucursal VALUES (6, 'INVERSIONES LIAL CARRION', 'CALLE CARRION #194, DPTO 203', 'CALLE CARRION #194, DPTO 203', '12345678', '987654322', 1, 1, '1');
INSERT INTO sucursal VALUES (7, 'INVERSIONES LIAL ELIAS AGUIRRE', 'ELIAS AGUIRRE 361, STAND 5', 'ELIAS AGUIRRE 361, STAND 5', '1234567', '1234567', 1, 1, '1');


--
-- Name: sucursal_id_sucursal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sucursal_id_sucursal_seq', 7, true);


--
-- Data for Name: tipo_categoria; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_categoria VALUES (1, 'Clase');
INSERT INTO tipo_categoria VALUES (2, 'Subcategoria');


--
-- Name: tipo_categoria_id_tipocategoria_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipo_categoria_id_tipocategoria_seq', 2, true);


--
-- Data for Name: ubigeo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ubigeo VALUES (1111, 'AMAZONAS', 'CHACHAPOYAS', 'CHACHAPOYAS');
INSERT INTO ubigeo VALUES (2112, 'AMAZONAS', 'CHACHAPOYAS', 'ASUNCION');
INSERT INTO ubigeo VALUES (3113, 'AMAZONAS', 'CHACHAPOYAS', 'BALSAS');
INSERT INTO ubigeo VALUES (4114, 'AMAZONAS', 'CHACHAPOYAS', 'CHETO');
INSERT INTO ubigeo VALUES (5115, 'AMAZONAS', 'CHACHAPOYAS', 'CHILIQUIN');
INSERT INTO ubigeo VALUES (6116, 'AMAZONAS', 'CHACHAPOYAS', 'CHUQUIBAMBA');
INSERT INTO ubigeo VALUES (7117, 'AMAZONAS', 'CHACHAPOYAS', 'GRANADA');
INSERT INTO ubigeo VALUES (8118, 'AMAZONAS', 'CHACHAPOYAS', 'HUANCAS');
INSERT INTO ubigeo VALUES (9119, 'AMAZONAS', 'CHACHAPOYAS', 'LA JALCA');
INSERT INTO ubigeo VALUES (22121, 'AMAZONAS', 'BAGUA', 'LA PECA');
INSERT INTO ubigeo VALUES (23122, 'AMAZONAS', 'BAGUA', 'ARAMANGO');
INSERT INTO ubigeo VALUES (24123, 'AMAZONAS', 'BAGUA', 'COPALLIN');
INSERT INTO ubigeo VALUES (25124, 'AMAZONAS', 'BAGUA', 'EL PARCO');
INSERT INTO ubigeo VALUES (26126, 'AMAZONAS', 'BAGUA', 'IMAZA');
INSERT INTO ubigeo VALUES (27131, 'AMAZONAS', 'BONGARA', 'JUMBILLA');
INSERT INTO ubigeo VALUES (28132, 'AMAZONAS', 'BONGARA', 'COROSHA');
INSERT INTO ubigeo VALUES (29133, 'AMAZONAS', 'BONGARA', 'CUISPES');
INSERT INTO ubigeo VALUES (30134, 'AMAZONAS', 'BONGARA', 'CHISQUILLA');
INSERT INTO ubigeo VALUES (31135, 'AMAZONAS', 'BONGARA', 'CHURUJA');
INSERT INTO ubigeo VALUES (32136, 'AMAZONAS', 'BONGARA', 'FLORIDA');
INSERT INTO ubigeo VALUES (33137, 'AMAZONAS', 'BONGARA', 'RECTA');
INSERT INTO ubigeo VALUES (34138, 'AMAZONAS', 'BONGARA', 'SAN CARLOS');
INSERT INTO ubigeo VALUES (35139, 'AMAZONAS', 'BONGARA', 'SHIPASBAMBA');
INSERT INTO ubigeo VALUES (39141, 'AMAZONAS', 'LUYA', 'LAMUD');
INSERT INTO ubigeo VALUES (40142, 'AMAZONAS', 'LUYA', 'CAMPORREDONDO');
INSERT INTO ubigeo VALUES (41143, 'AMAZONAS', 'LUYA', 'COCABAMBA');
INSERT INTO ubigeo VALUES (42144, 'AMAZONAS', 'LUYA', 'COLCAMAR');
INSERT INTO ubigeo VALUES (43145, 'AMAZONAS', 'LUYA', 'CONILA');
INSERT INTO ubigeo VALUES (44146, 'AMAZONAS', 'LUYA', 'INGUILPATA');
INSERT INTO ubigeo VALUES (45147, 'AMAZONAS', 'LUYA', 'LONGUITA');
INSERT INTO ubigeo VALUES (46148, 'AMAZONAS', 'LUYA', 'LONYA CHICO');
INSERT INTO ubigeo VALUES (47149, 'AMAZONAS', 'LUYA', 'LUYA');
INSERT INTO ubigeo VALUES (62151, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SAN NICOLAS');
INSERT INTO ubigeo VALUES (63152, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'COCHAMAL');
INSERT INTO ubigeo VALUES (64153, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'CHIRIMOTO');
INSERT INTO ubigeo VALUES (65154, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'HUAMBO');
INSERT INTO ubigeo VALUES (66155, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LIMABAMBA');
INSERT INTO ubigeo VALUES (67156, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'LONGAR');
INSERT INTO ubigeo VALUES (68157, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MILPUC');
INSERT INTO ubigeo VALUES (69158, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'MCAL BENAVIDES');
INSERT INTO ubigeo VALUES (70159, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'OMIA');
INSERT INTO ubigeo VALUES (74161, 'AMAZONAS', 'CONDORCANQUI', 'NIEVA');
INSERT INTO ubigeo VALUES (75162, 'AMAZONAS', 'CONDORCANQUI', 'RIO SANTIAGO');
INSERT INTO ubigeo VALUES (76163, 'AMAZONAS', 'CONDORCANQUI', 'EL CENEPA');
INSERT INTO ubigeo VALUES (77171, 'AMAZONAS', 'UTCUBAMBA', 'BAGUA GRANDE');
INSERT INTO ubigeo VALUES (78172, 'AMAZONAS', 'UTCUBAMBA', 'CAJARURO');
INSERT INTO ubigeo VALUES (79173, 'AMAZONAS', 'UTCUBAMBA', 'CUMBA');
INSERT INTO ubigeo VALUES (80174, 'AMAZONAS', 'UTCUBAMBA', 'EL MILAGRO');
INSERT INTO ubigeo VALUES (81175, 'AMAZONAS', 'UTCUBAMBA', 'JAMALCA');
INSERT INTO ubigeo VALUES (82176, 'AMAZONAS', 'UTCUBAMBA', 'LONYA GRANDE');
INSERT INTO ubigeo VALUES (83177, 'AMAZONAS', 'UTCUBAMBA', 'YAMON');
INSERT INTO ubigeo VALUES (84211, 'ANCASH', 'HUARAZ', 'HUARAZ');
INSERT INTO ubigeo VALUES (85212, 'ANCASH', 'HUARAZ', 'INDEPENDENCIA');
INSERT INTO ubigeo VALUES (86213, 'ANCASH', 'HUARAZ', 'COCHABAMBA');
INSERT INTO ubigeo VALUES (87214, 'ANCASH', 'HUARAZ', 'COLCABAMBA');
INSERT INTO ubigeo VALUES (88215, 'ANCASH', 'HUARAZ', 'HUANCHAY');
INSERT INTO ubigeo VALUES (89216, 'ANCASH', 'HUARAZ', 'JANGAS');
INSERT INTO ubigeo VALUES (90217, 'ANCASH', 'HUARAZ', 'LA LIBERTAD');
INSERT INTO ubigeo VALUES (91218, 'ANCASH', 'HUARAZ', 'OLLEROS');
INSERT INTO ubigeo VALUES (92219, 'ANCASH', 'HUARAZ', 'PAMPAS');
INSERT INTO ubigeo VALUES (96221, 'ANCASH', 'AIJA', 'AIJA');
INSERT INTO ubigeo VALUES (97223, 'ANCASH', 'AIJA', 'CORIS');
INSERT INTO ubigeo VALUES (98225, 'ANCASH', 'AIJA', 'HUACLLAN');
INSERT INTO ubigeo VALUES (99226, 'ANCASH', 'AIJA', 'LA MERCED');
INSERT INTO ubigeo VALUES (100228, 'ANCASH', 'AIJA', 'SUCCHA');
INSERT INTO ubigeo VALUES (101110, 'AMAZONAS', 'CHACHAPOYAS', 'LEIMEBAMBA');
INSERT INTO ubigeo VALUES (101231, 'ANCASH', 'BOLOGNESI', 'CHIQUIAN');
INSERT INTO ubigeo VALUES (102232, 'ANCASH', 'BOLOGNESI', 'A PARDO LEZAMETA');
INSERT INTO ubigeo VALUES (103234, 'ANCASH', 'BOLOGNESI', 'AQUIA');
INSERT INTO ubigeo VALUES (104235, 'ANCASH', 'BOLOGNESI', 'CAJACAY');
INSERT INTO ubigeo VALUES (111111, 'AMAZONAS', 'CHACHAPOYAS', 'LEVANTO');
INSERT INTO ubigeo VALUES (116241, 'ANCASH', 'CARHUAZ', 'CARHUAZ');
INSERT INTO ubigeo VALUES (117242, 'ANCASH', 'CARHUAZ', 'ACOPAMPA');
INSERT INTO ubigeo VALUES (118243, 'ANCASH', 'CARHUAZ', 'AMASHCA');
INSERT INTO ubigeo VALUES (119244, 'ANCASH', 'CARHUAZ', 'ANTA');
INSERT INTO ubigeo VALUES (120245, 'ANCASH', 'CARHUAZ', 'ATAQUERO');
INSERT INTO ubigeo VALUES (121112, 'AMAZONAS', 'CHACHAPOYAS', 'MAGDALENA');
INSERT INTO ubigeo VALUES (121246, 'ANCASH', 'CARHUAZ', 'MARCARA');
INSERT INTO ubigeo VALUES (122247, 'ANCASH', 'CARHUAZ', 'PARIAHUANCA');
INSERT INTO ubigeo VALUES (123248, 'ANCASH', 'CARHUAZ', 'SAN MIGUEL DE ACO');
INSERT INTO ubigeo VALUES (124249, 'ANCASH', 'CARHUAZ', 'SHILLA');
INSERT INTO ubigeo VALUES (127251, 'ANCASH', 'CASMA', 'CASMA');
INSERT INTO ubigeo VALUES (128252, 'ANCASH', 'CASMA', 'BUENA VISTA ALTA');
INSERT INTO ubigeo VALUES (129253, 'ANCASH', 'CASMA', 'COMANDANTE NOEL');
INSERT INTO ubigeo VALUES (130255, 'ANCASH', 'CASMA', 'YAUTAN');
INSERT INTO ubigeo VALUES (131113, 'AMAZONAS', 'CHACHAPOYAS', 'MARISCAL CASTILLA');
INSERT INTO ubigeo VALUES (131261, 'ANCASH', 'CORONGO', 'CORONGO');
INSERT INTO ubigeo VALUES (132262, 'ANCASH', 'CORONGO', 'ACO');
INSERT INTO ubigeo VALUES (133263, 'ANCASH', 'CORONGO', 'BAMBAS');
INSERT INTO ubigeo VALUES (134264, 'ANCASH', 'CORONGO', 'CUSCA');
INSERT INTO ubigeo VALUES (135265, 'ANCASH', 'CORONGO', 'LA PAMPA');
INSERT INTO ubigeo VALUES (136266, 'ANCASH', 'CORONGO', 'YANAC');
INSERT INTO ubigeo VALUES (137267, 'ANCASH', 'CORONGO', 'YUPAN');
INSERT INTO ubigeo VALUES (138271, 'ANCASH', 'HUAYLAS', 'CARAZ');
INSERT INTO ubigeo VALUES (139272, 'ANCASH', 'HUAYLAS', 'HUALLANCA');
INSERT INTO ubigeo VALUES (140273, 'ANCASH', 'HUAYLAS', 'HUATA');
INSERT INTO ubigeo VALUES (141114, 'AMAZONAS', 'CHACHAPOYAS', 'MOLINOPAMPA');
INSERT INTO ubigeo VALUES (141274, 'ANCASH', 'HUAYLAS', 'HUAYLAS');
INSERT INTO ubigeo VALUES (142275, 'ANCASH', 'HUAYLAS', 'MATO');
INSERT INTO ubigeo VALUES (143276, 'ANCASH', 'HUAYLAS', 'PAMPAROMAS');
INSERT INTO ubigeo VALUES (144277, 'ANCASH', 'HUAYLAS', 'PUEBLO LIBRE');
INSERT INTO ubigeo VALUES (145278, 'ANCASH', 'HUAYLAS', 'SANTA CRUZ');
INSERT INTO ubigeo VALUES (146279, 'ANCASH', 'HUAYLAS', 'YURACMARCA');
INSERT INTO ubigeo VALUES (148281, 'ANCASH', 'HUARI', 'HUARI');
INSERT INTO ubigeo VALUES (149282, 'ANCASH', 'HUARI', 'CAJAY');
INSERT INTO ubigeo VALUES (150283, 'ANCASH', 'HUARI', 'CHAVIN DE HUANTAR');
INSERT INTO ubigeo VALUES (151115, 'AMAZONAS', 'CHACHAPOYAS', 'MONTEVIDEO');
INSERT INTO ubigeo VALUES (151284, 'ANCASH', 'HUARI', 'HUACACHI');
INSERT INTO ubigeo VALUES (152285, 'ANCASH', 'HUARI', 'HUACHIS');
INSERT INTO ubigeo VALUES (153286, 'ANCASH', 'HUARI', 'HUACCHIS');
INSERT INTO ubigeo VALUES (154287, 'ANCASH', 'HUARI', 'HUANTAR');
INSERT INTO ubigeo VALUES (155288, 'ANCASH', 'HUARI', 'MASIN');
INSERT INTO ubigeo VALUES (156289, 'ANCASH', 'HUARI', 'PAUCAS');
INSERT INTO ubigeo VALUES (161116, 'AMAZONAS', 'CHACHAPOYAS', 'OLLEROS');
INSERT INTO ubigeo VALUES (164291, 'ANCASH', 'MARISCAL LUZURIAGA', 'PISCOBAMBA');
INSERT INTO ubigeo VALUES (165292, 'ANCASH', 'MARISCAL LUZURIAGA', 'CASCA');
INSERT INTO ubigeo VALUES (166293, 'ANCASH', 'MARISCAL LUZURIAGA', 'LUCMA');
INSERT INTO ubigeo VALUES (167294, 'ANCASH', 'MARISCAL LUZURIAGA', 'FIDEL OLIVAS ESCUDERO');
INSERT INTO ubigeo VALUES (168295, 'ANCASH', 'MARISCAL LUZURIAGA', 'LLAMA');
INSERT INTO ubigeo VALUES (169296, 'ANCASH', 'MARISCAL LUZURIAGA', 'LLUMPA');
INSERT INTO ubigeo VALUES (170297, 'ANCASH', 'MARISCAL LUZURIAGA', 'MUSGA');
INSERT INTO ubigeo VALUES (171117, 'AMAZONAS', 'CHACHAPOYAS', 'QUINJALCA');
INSERT INTO ubigeo VALUES (171298, 'ANCASH', 'MARISCAL LUZURIAGA', 'ELEAZAR GUZMAN BARRON');
INSERT INTO ubigeo VALUES (181118, 'AMAZONAS', 'CHACHAPOYAS', 'SAN FCO DE DAGUAS');
INSERT INTO ubigeo VALUES (191119, 'AMAZONAS', 'CHACHAPOYAS', 'SAN ISIDRO DE MAINO');
INSERT INTO ubigeo VALUES (201120, 'AMAZONAS', 'CHACHAPOYAS', 'SOLOCO');
INSERT INTO ubigeo VALUES (211121, 'AMAZONAS', 'CHACHAPOYAS', 'SONCHE');
INSERT INTO ubigeo VALUES (250311, 'APURIMAC', 'ABANCAY', 'ABANCAY');
INSERT INTO ubigeo VALUES (251312, 'APURIMAC', 'ABANCAY', 'CIRCA');
INSERT INTO ubigeo VALUES (252313, 'APURIMAC', 'ABANCAY', 'CURAHUASI');
INSERT INTO ubigeo VALUES (253314, 'APURIMAC', 'ABANCAY', 'CHACOCHE');
INSERT INTO ubigeo VALUES (254315, 'APURIMAC', 'ABANCAY', 'HUANIPACA');
INSERT INTO ubigeo VALUES (255316, 'APURIMAC', 'ABANCAY', 'LAMBRAMA');
INSERT INTO ubigeo VALUES (256317, 'APURIMAC', 'ABANCAY', 'PICHIRHUA');
INSERT INTO ubigeo VALUES (257318, 'APURIMAC', 'ABANCAY', 'SAN PEDRO DE CACHORA');
INSERT INTO ubigeo VALUES (258319, 'APURIMAC', 'ABANCAY', 'TAMBURCO');
INSERT INTO ubigeo VALUES (259321, 'APURIMAC', 'AYMARAES', 'CHALHUANCA');
INSERT INTO ubigeo VALUES (260322, 'APURIMAC', 'AYMARAES', 'CAPAYA');
INSERT INTO ubigeo VALUES (261323, 'APURIMAC', 'AYMARAES', 'CARAYBAMBA');
INSERT INTO ubigeo VALUES (262324, 'APURIMAC', 'AYMARAES', 'COLCABAMBA');
INSERT INTO ubigeo VALUES (263325, 'APURIMAC', 'AYMARAES', 'COTARUSE');
INSERT INTO ubigeo VALUES (264326, 'APURIMAC', 'AYMARAES', 'CHAPIMARCA');
INSERT INTO ubigeo VALUES (265327, 'APURIMAC', 'AYMARAES', 'IHUAYLLO');
INSERT INTO ubigeo VALUES (266328, 'APURIMAC', 'AYMARAES', 'LUCRE');
INSERT INTO ubigeo VALUES (267329, 'APURIMAC', 'AYMARAES', 'POCOHUANCA');
INSERT INTO ubigeo VALUES (276331, 'APURIMAC', 'ANDAHUAYLAS', 'ANDAHUAYLAS');
INSERT INTO ubigeo VALUES (277332, 'APURIMAC', 'ANDAHUAYLAS', 'ANDARAPA');
INSERT INTO ubigeo VALUES (278333, 'APURIMAC', 'ANDAHUAYLAS', 'CHIARA');
INSERT INTO ubigeo VALUES (279334, 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAMA');
INSERT INTO ubigeo VALUES (280335, 'APURIMAC', 'ANDAHUAYLAS', 'HUANCARAY');
INSERT INTO ubigeo VALUES (281336, 'APURIMAC', 'ANDAHUAYLAS', 'KISHUARA');
INSERT INTO ubigeo VALUES (282337, 'APURIMAC', 'ANDAHUAYLAS', 'PACOBAMBA');
INSERT INTO ubigeo VALUES (283338, 'APURIMAC', 'ANDAHUAYLAS', 'PAMPACHIRI');
INSERT INTO ubigeo VALUES (284339, 'APURIMAC', 'ANDAHUAYLAS', 'SAN ANTONIO DE CACHI');
INSERT INTO ubigeo VALUES (295341, 'APURIMAC', 'ANTABAMBA', 'ANTABAMBA');
INSERT INTO ubigeo VALUES (296342, 'APURIMAC', 'ANTABAMBA', 'EL ORO');
INSERT INTO ubigeo VALUES (297343, 'APURIMAC', 'ANTABAMBA', 'HUAQUIRCA');
INSERT INTO ubigeo VALUES (298344, 'APURIMAC', 'ANTABAMBA', 'JUAN ESPINOZA MEDRANO');
INSERT INTO ubigeo VALUES (299345, 'APURIMAC', 'ANTABAMBA', 'OROPESA');
INSERT INTO ubigeo VALUES (300346, 'APURIMAC', 'ANTABAMBA', 'PACHACONAS');
INSERT INTO ubigeo VALUES (301347, 'APURIMAC', 'ANTABAMBA', 'SABAINO');
INSERT INTO ubigeo VALUES (302351, 'APURIMAC', 'COTABAMBAS', 'TAMBOBAMBA');
INSERT INTO ubigeo VALUES (303352, 'APURIMAC', 'COTABAMBAS', 'COYLLURQUI');
INSERT INTO ubigeo VALUES (304353, 'APURIMAC', 'COTABAMBAS', 'COTABAMBAS');
INSERT INTO ubigeo VALUES (305354, 'APURIMAC', 'COTABAMBAS', 'HAQUIRA');
INSERT INTO ubigeo VALUES (306355, 'APURIMAC', 'COTABAMBAS', 'MARA');
INSERT INTO ubigeo VALUES (307356, 'APURIMAC', 'COTABAMBAS', 'CHALLHUAHUACHO');
INSERT INTO ubigeo VALUES (308361, 'APURIMAC', 'GRAU', 'CHUQUIBAMBILLA');
INSERT INTO ubigeo VALUES (309362, 'APURIMAC', 'GRAU', 'CURPAHUASI');
INSERT INTO ubigeo VALUES (310363, 'APURIMAC', 'GRAU', 'HUAILLATI');
INSERT INTO ubigeo VALUES (311364, 'APURIMAC', 'GRAU', 'MAMARA');
INSERT INTO ubigeo VALUES (312365, 'APURIMAC', 'GRAU', 'MARISCAL GAMARRA');
INSERT INTO ubigeo VALUES (313366, 'APURIMAC', 'GRAU', 'MICAELA BASTIDAS');
INSERT INTO ubigeo VALUES (314367, 'APURIMAC', 'GRAU', 'PROGRESO');
INSERT INTO ubigeo VALUES (315368, 'APURIMAC', 'GRAU', 'PATAYPAMPA');
INSERT INTO ubigeo VALUES (316369, 'APURIMAC', 'GRAU', 'SAN ANTONIO');
INSERT INTO ubigeo VALUES (322371, 'APURIMAC', 'CHINCHEROS', 'CHINCHEROS');
INSERT INTO ubigeo VALUES (323372, 'APURIMAC', 'CHINCHEROS', 'ONGOY');
INSERT INTO ubigeo VALUES (324373, 'APURIMAC', 'CHINCHEROS', 'OCOBAMBA');
INSERT INTO ubigeo VALUES (325374, 'APURIMAC', 'CHINCHEROS', 'COCHARCAS');
INSERT INTO ubigeo VALUES (326375, 'APURIMAC', 'CHINCHEROS', 'ANCO HUALLO');
INSERT INTO ubigeo VALUES (327376, 'APURIMAC', 'CHINCHEROS', 'HUACCANA');
INSERT INTO ubigeo VALUES (328377, 'APURIMAC', 'CHINCHEROS', 'URANMARCA');
INSERT INTO ubigeo VALUES (329378, 'APURIMAC', 'CHINCHEROS', 'RANRACANCHA');
INSERT INTO ubigeo VALUES (330411, 'AREQUIPA', 'AREQUIPA', 'AREQUIPA');
INSERT INTO ubigeo VALUES (331412, 'AREQUIPA', 'AREQUIPA', 'CAYMA');
INSERT INTO ubigeo VALUES (332413, 'AREQUIPA', 'AREQUIPA', 'CERRO COLORADO');
INSERT INTO ubigeo VALUES (333414, 'AREQUIPA', 'AREQUIPA', 'CHARACATO');
INSERT INTO ubigeo VALUES (334415, 'AREQUIPA', 'AREQUIPA', 'CHIGUATA');
INSERT INTO ubigeo VALUES (335416, 'AREQUIPA', 'AREQUIPA', 'LA JOYA');
INSERT INTO ubigeo VALUES (336417, 'AREQUIPA', 'AREQUIPA', 'MIRAFLORES');
INSERT INTO ubigeo VALUES (337418, 'AREQUIPA', 'AREQUIPA', 'MOLLEBAYA');
INSERT INTO ubigeo VALUES (338419, 'AREQUIPA', 'AREQUIPA', 'PAUCARPATA');
INSERT INTO ubigeo VALUES (359421, 'AREQUIPA', 'CAYLLOMA', 'CHIVAY');
INSERT INTO ubigeo VALUES (360422, 'AREQUIPA', 'CAYLLOMA', 'ACHOMA');
INSERT INTO ubigeo VALUES (361310, 'AMAZONAS', 'BONGARA', 'VALERA');
INSERT INTO ubigeo VALUES (361423, 'AREQUIPA', 'CAYLLOMA', 'CABANACONDE');
INSERT INTO ubigeo VALUES (362424, 'AREQUIPA', 'CAYLLOMA', 'CAYLLOMA');
INSERT INTO ubigeo VALUES (363425, 'AREQUIPA', 'CAYLLOMA', 'CALLALLI');
INSERT INTO ubigeo VALUES (364426, 'AREQUIPA', 'CAYLLOMA', 'COPORAQUE');
INSERT INTO ubigeo VALUES (365427, 'AREQUIPA', 'CAYLLOMA', 'HUAMBO');
INSERT INTO ubigeo VALUES (366428, 'AREQUIPA', 'CAYLLOMA', 'HUANCA');
INSERT INTO ubigeo VALUES (367429, 'AREQUIPA', 'CAYLLOMA', 'ICHUPAMPA');
INSERT INTO ubigeo VALUES (371311, 'AMAZONAS', 'BONGARA', 'YAMBRASBAMBA');
INSERT INTO ubigeo VALUES (379431, 'AREQUIPA', 'CAMANA', 'CAMANA');
INSERT INTO ubigeo VALUES (380432, 'AREQUIPA', 'CAMANA', 'JOSE MARIA QUIMPER');
INSERT INTO ubigeo VALUES (381312, 'AMAZONAS', 'BONGARA', 'JAZAN');
INSERT INTO ubigeo VALUES (381433, 'AREQUIPA', 'CAMANA', 'MARIANO N VALCARCEL');
INSERT INTO ubigeo VALUES (382434, 'AREQUIPA', 'CAMANA', 'MARISCAL CACERES');
INSERT INTO ubigeo VALUES (383435, 'AREQUIPA', 'CAMANA', 'NICOLAS DE PIEROLA');
INSERT INTO ubigeo VALUES (384436, 'AREQUIPA', 'CAMANA', 'OCONA');
INSERT INTO ubigeo VALUES (385437, 'AREQUIPA', 'CAMANA', 'QUILCA');
INSERT INTO ubigeo VALUES (386438, 'AREQUIPA', 'CAMANA', 'SAMUEL PASTOR');
INSERT INTO ubigeo VALUES (387441, 'AREQUIPA', 'CARAVELI', 'CARAVELI');
INSERT INTO ubigeo VALUES (388442, 'AREQUIPA', 'CARAVELI', 'ACARI');
INSERT INTO ubigeo VALUES (389443, 'AREQUIPA', 'CARAVELI', 'ATICO');
INSERT INTO ubigeo VALUES (390444, 'AREQUIPA', 'CARAVELI', 'ATIQUIPA');
INSERT INTO ubigeo VALUES (391445, 'AREQUIPA', 'CARAVELI', 'BELLA UNION');
INSERT INTO ubigeo VALUES (392446, 'AREQUIPA', 'CARAVELI', 'CAHUACHO');
INSERT INTO ubigeo VALUES (393447, 'AREQUIPA', 'CARAVELI', 'CHALA');
INSERT INTO ubigeo VALUES (394448, 'AREQUIPA', 'CARAVELI', 'CHAPARRA');
INSERT INTO ubigeo VALUES (395449, 'AREQUIPA', 'CARAVELI', 'HUANUHUANU');
INSERT INTO ubigeo VALUES (400451, 'AREQUIPA', 'CASTILLA', 'APLAO');
INSERT INTO ubigeo VALUES (401452, 'AREQUIPA', 'CASTILLA', 'ANDAGUA');
INSERT INTO ubigeo VALUES (402453, 'AREQUIPA', 'CASTILLA', 'AYO');
INSERT INTO ubigeo VALUES (403454, 'AREQUIPA', 'CASTILLA', 'CHACHAS');
INSERT INTO ubigeo VALUES (404455, 'AREQUIPA', 'CASTILLA', 'CHILCAYMARCA');
INSERT INTO ubigeo VALUES (405456, 'AREQUIPA', 'CASTILLA', 'CHOCO');
INSERT INTO ubigeo VALUES (406457, 'AREQUIPA', 'CASTILLA', 'HUANCARQUI');
INSERT INTO ubigeo VALUES (407458, 'AREQUIPA', 'CASTILLA', 'MACHAGUAY');
INSERT INTO ubigeo VALUES (408459, 'AREQUIPA', 'CASTILLA', 'ORCOPAMPA');
INSERT INTO ubigeo VALUES (414461, 'AREQUIPA', 'CONDESUYOS', 'CHUQUIBAMBA');
INSERT INTO ubigeo VALUES (415462, 'AREQUIPA', 'CONDESUYOS', 'ANDARAY');
INSERT INTO ubigeo VALUES (416463, 'AREQUIPA', 'CONDESUYOS', 'CAYARANI');
INSERT INTO ubigeo VALUES (417464, 'AREQUIPA', 'CONDESUYOS', 'CHICHAS');
INSERT INTO ubigeo VALUES (418465, 'AREQUIPA', 'CONDESUYOS', 'IRAY');
INSERT INTO ubigeo VALUES (419466, 'AREQUIPA', 'CONDESUYOS', 'SALAMANCA');
INSERT INTO ubigeo VALUES (420467, 'AREQUIPA', 'CONDESUYOS', 'YANAQUIHUA');
INSERT INTO ubigeo VALUES (421468, 'AREQUIPA', 'CONDESUYOS', 'RIO GRANDE');
INSERT INTO ubigeo VALUES (422471, 'AREQUIPA', 'ISLAY', 'MOLLENDO');
INSERT INTO ubigeo VALUES (423472, 'AREQUIPA', 'ISLAY', 'COCACHACRA');
INSERT INTO ubigeo VALUES (424473, 'AREQUIPA', 'ISLAY', 'DEAN VALDIVIA');
INSERT INTO ubigeo VALUES (425474, 'AREQUIPA', 'ISLAY', 'ISLAY');
INSERT INTO ubigeo VALUES (426475, 'AREQUIPA', 'ISLAY', 'MEJIA');
INSERT INTO ubigeo VALUES (427476, 'AREQUIPA', 'ISLAY', 'PUNTA DE BOMBON');
INSERT INTO ubigeo VALUES (428481, 'AREQUIPA', 'LA UNION', 'COTAHUASI');
INSERT INTO ubigeo VALUES (429482, 'AREQUIPA', 'LA UNION', 'ALCA');
INSERT INTO ubigeo VALUES (430483, 'AREQUIPA', 'LA UNION', 'CHARCANA');
INSERT INTO ubigeo VALUES (431484, 'AREQUIPA', 'LA UNION', 'HUAYNACOTAS');
INSERT INTO ubigeo VALUES (432485, 'AREQUIPA', 'LA UNION', 'PAMPAMARCA');
INSERT INTO ubigeo VALUES (433486, 'AREQUIPA', 'LA UNION', 'PUYCA');
INSERT INTO ubigeo VALUES (434487, 'AREQUIPA', 'LA UNION', 'QUECHUALLA');
INSERT INTO ubigeo VALUES (435488, 'AREQUIPA', 'LA UNION', 'SAYLA');
INSERT INTO ubigeo VALUES (436489, 'AREQUIPA', 'LA UNION', 'TAURIA');
INSERT INTO ubigeo VALUES (439511, 'AYACUCHO', 'HUAMANGA', 'AYACUCHO');
INSERT INTO ubigeo VALUES (440512, 'AYACUCHO', 'HUAMANGA', 'ACOS VINCHOS');
INSERT INTO ubigeo VALUES (441513, 'AYACUCHO', 'HUAMANGA', 'CARMEN ALTO');
INSERT INTO ubigeo VALUES (442514, 'AYACUCHO', 'HUAMANGA', 'CHIARA');
INSERT INTO ubigeo VALUES (443515, 'AYACUCHO', 'HUAMANGA', 'QUINUA');
INSERT INTO ubigeo VALUES (444516, 'AYACUCHO', 'HUAMANGA', 'SAN JOSE DE TICLLAS');
INSERT INTO ubigeo VALUES (445517, 'AYACUCHO', 'HUAMANGA', 'SAN JUAN BAUTISTA');
INSERT INTO ubigeo VALUES (446518, 'AYACUCHO', 'HUAMANGA', 'SANTIAGO DE PISCHA');
INSERT INTO ubigeo VALUES (447519, 'AYACUCHO', 'HUAMANGA', 'VINCHOS');
INSERT INTO ubigeo VALUES (454521, 'AYACUCHO', 'CANGALLO', 'CANGALLO');
INSERT INTO ubigeo VALUES (455524, 'AYACUCHO', 'CANGALLO', 'CHUSCHI');
INSERT INTO ubigeo VALUES (456526, 'AYACUCHO', 'CANGALLO', 'LOS MOROCHUCOS');
INSERT INTO ubigeo VALUES (457527, 'AYACUCHO', 'CANGALLO', 'PARAS');
INSERT INTO ubigeo VALUES (458528, 'AYACUCHO', 'CANGALLO', 'TOTOS');
INSERT INTO ubigeo VALUES (460531, 'AYACUCHO', 'HUANTA', 'HUANTA');
INSERT INTO ubigeo VALUES (461532, 'AYACUCHO', 'HUANTA', 'AYAHUANCO');
INSERT INTO ubigeo VALUES (462533, 'AYACUCHO', 'HUANTA', 'HUAMANGUILLA');
INSERT INTO ubigeo VALUES (463534, 'AYACUCHO', 'HUANTA', 'IGUAIN');
INSERT INTO ubigeo VALUES (464535, 'AYACUCHO', 'HUANTA', 'LURICOCHA');
INSERT INTO ubigeo VALUES (465537, 'AYACUCHO', 'HUANTA', 'SANTILLANA');
INSERT INTO ubigeo VALUES (466538, 'AYACUCHO', 'HUANTA', 'SIVIA');
INSERT INTO ubigeo VALUES (467539, 'AYACUCHO', 'HUANTA', 'LLOCHEGUA');
INSERT INTO ubigeo VALUES (468541, 'AYACUCHO', 'LA MAR', 'SAN MIGUEL');
INSERT INTO ubigeo VALUES (469542, 'AYACUCHO', 'LA MAR', 'ANCO');
INSERT INTO ubigeo VALUES (470543, 'AYACUCHO', 'LA MAR', 'AYNA');
INSERT INTO ubigeo VALUES (471544, 'AYACUCHO', 'LA MAR', 'CHILCAS');
INSERT INTO ubigeo VALUES (472545, 'AYACUCHO', 'LA MAR', 'CHUNGUI');
INSERT INTO ubigeo VALUES (473546, 'AYACUCHO', 'LA MAR', 'TAMBO');
INSERT INTO ubigeo VALUES (474547, 'AYACUCHO', 'LA MAR', 'LUIS CARRANZA');
INSERT INTO ubigeo VALUES (475548, 'AYACUCHO', 'LA MAR', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (476551, 'AYACUCHO', 'LUCANAS', 'PUQUIO');
INSERT INTO ubigeo VALUES (477552, 'AYACUCHO', 'LUCANAS', 'AUCARA');
INSERT INTO ubigeo VALUES (478553, 'AYACUCHO', 'LUCANAS', 'CABANA');
INSERT INTO ubigeo VALUES (479554, 'AYACUCHO', 'LUCANAS', 'CARMEN SALCEDO');
INSERT INTO ubigeo VALUES (480556, 'AYACUCHO', 'LUCANAS', 'CHAVINA');
INSERT INTO ubigeo VALUES (481410, 'AMAZONAS', 'LUYA', 'LUYA VIEJO');
INSERT INTO ubigeo VALUES (481558, 'AYACUCHO', 'LUCANAS', 'CHIPAO');
INSERT INTO ubigeo VALUES (491411, 'AMAZONAS', 'LUYA', 'MARIA');
INSERT INTO ubigeo VALUES (497561, 'AYACUCHO', 'PARINACOCHAS', 'CORACORA');
INSERT INTO ubigeo VALUES (498564, 'AYACUCHO', 'PARINACOCHAS', 'CORONEL CASTANEDA');
INSERT INTO ubigeo VALUES (499565, 'AYACUCHO', 'PARINACOCHAS', 'CHUMPI');
INSERT INTO ubigeo VALUES (500568, 'AYACUCHO', 'PARINACOCHAS', 'PACAPAUSA');
INSERT INTO ubigeo VALUES (501412, 'AMAZONAS', 'LUYA', 'OCALLI');
INSERT INTO ubigeo VALUES (505571, 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCAPI');
INSERT INTO ubigeo VALUES (506572, 'AYACUCHO', 'VICTOR FAJARDO', 'ALCAMENCA');
INSERT INTO ubigeo VALUES (507573, 'AYACUCHO', 'VICTOR FAJARDO', 'APONGO');
INSERT INTO ubigeo VALUES (508574, 'AYACUCHO', 'VICTOR FAJARDO', 'CANARIA');
INSERT INTO ubigeo VALUES (509576, 'AYACUCHO', 'VICTOR FAJARDO', 'CAYARA');
INSERT INTO ubigeo VALUES (510577, 'AYACUCHO', 'VICTOR FAJARDO', 'COLCA');
INSERT INTO ubigeo VALUES (511413, 'AMAZONAS', 'LUYA', 'OCUMAL');
INSERT INTO ubigeo VALUES (511578, 'AYACUCHO', 'VICTOR FAJARDO', 'HUAYA');
INSERT INTO ubigeo VALUES (512579, 'AYACUCHO', 'VICTOR FAJARDO', 'HUAMANQUIQUIA');
INSERT INTO ubigeo VALUES (517581, 'AYACUCHO', 'HUANCA SANCOS', 'SANCOS');
INSERT INTO ubigeo VALUES (518582, 'AYACUCHO', 'HUANCA SANCOS', 'SACSAMARCA');
INSERT INTO ubigeo VALUES (519583, 'AYACUCHO', 'HUANCA SANCOS', 'SANTIAGO DE LUCANAMARCA');
INSERT INTO ubigeo VALUES (520584, 'AYACUCHO', 'HUANCA SANCOS', 'CARAPO');
INSERT INTO ubigeo VALUES (521414, 'AMAZONAS', 'LUYA', 'PISUQUIA');
INSERT INTO ubigeo VALUES (521591, 'AYACUCHO', 'VILCAS HUAMAN', 'VILCAS HUAMAN');
INSERT INTO ubigeo VALUES (522592, 'AYACUCHO', 'VILCAS HUAMAN', 'VISCHONGO');
INSERT INTO ubigeo VALUES (523593, 'AYACUCHO', 'VILCAS HUAMAN', 'ACCOMARCA');
INSERT INTO ubigeo VALUES (524594, 'AYACUCHO', 'VILCAS HUAMAN', 'CARHUANCA');
INSERT INTO ubigeo VALUES (525595, 'AYACUCHO', 'VILCAS HUAMAN', 'CONCEPCION');
INSERT INTO ubigeo VALUES (526596, 'AYACUCHO', 'VILCAS HUAMAN', 'HUAMBALPA');
INSERT INTO ubigeo VALUES (527597, 'AYACUCHO', 'VILCAS HUAMAN', 'SAURAMA');
INSERT INTO ubigeo VALUES (528598, 'AYACUCHO', 'VILCAS HUAMAN', 'INDEPENDENCIA');
INSERT INTO ubigeo VALUES (531415, 'AMAZONAS', 'LUYA', 'SAN CRISTOBAL');
INSERT INTO ubigeo VALUES (541416, 'AMAZONAS', 'LUYA', 'SAN FRANCISCO DE YESO');
INSERT INTO ubigeo VALUES (550611, 'CAJAMARCA', 'CAJAMARCA', 'CAJAMARCA');
INSERT INTO ubigeo VALUES (551417, 'AMAZONAS', 'LUYA', 'SAN JERONIMO');
INSERT INTO ubigeo VALUES (551612, 'CAJAMARCA', 'CAJAMARCA', 'ASUNCION');
INSERT INTO ubigeo VALUES (552613, 'CAJAMARCA', 'CAJAMARCA', 'COSPAN');
INSERT INTO ubigeo VALUES (553614, 'CAJAMARCA', 'CAJAMARCA', 'CHETILLA');
INSERT INTO ubigeo VALUES (554615, 'CAJAMARCA', 'CAJAMARCA', 'ENCANADA');
INSERT INTO ubigeo VALUES (555616, 'CAJAMARCA', 'CAJAMARCA', 'JESUS');
INSERT INTO ubigeo VALUES (556617, 'CAJAMARCA', 'CAJAMARCA', 'LOS BANOS DEL INCA');
INSERT INTO ubigeo VALUES (557618, 'CAJAMARCA', 'CAJAMARCA', 'LLACANORA');
INSERT INTO ubigeo VALUES (558619, 'CAJAMARCA', 'CAJAMARCA', 'MAGDALENA');
INSERT INTO ubigeo VALUES (561418, 'AMAZONAS', 'LUYA', 'SAN JUAN DE LOPECANCHA');
INSERT INTO ubigeo VALUES (562621, 'CAJAMARCA', 'CAJABAMBA', 'CAJABAMBA');
INSERT INTO ubigeo VALUES (563622, 'CAJAMARCA', 'CAJABAMBA', 'CACHACHI');
INSERT INTO ubigeo VALUES (564623, 'CAJAMARCA', 'CAJABAMBA', 'CONDEBAMBA');
INSERT INTO ubigeo VALUES (565625, 'CAJAMARCA', 'CAJABAMBA', 'SITACOCHA');
INSERT INTO ubigeo VALUES (566631, 'CAJAMARCA', 'CELENDIN', 'CELENDIN');
INSERT INTO ubigeo VALUES (567632, 'CAJAMARCA', 'CELENDIN', 'CORTEGANA');
INSERT INTO ubigeo VALUES (568633, 'CAJAMARCA', 'CELENDIN', 'CHUMUCH');
INSERT INTO ubigeo VALUES (569634, 'CAJAMARCA', 'CELENDIN', 'HUASMIN');
INSERT INTO ubigeo VALUES (570635, 'CAJAMARCA', 'CELENDIN', 'JORGE CHAVEZ');
INSERT INTO ubigeo VALUES (571419, 'AMAZONAS', 'LUYA', 'SANTA CATALINA');
INSERT INTO ubigeo VALUES (571636, 'CAJAMARCA', 'CELENDIN', 'JOSE GALVEZ');
INSERT INTO ubigeo VALUES (572637, 'CAJAMARCA', 'CELENDIN', 'MIGUEL IGLESIAS');
INSERT INTO ubigeo VALUES (573638, 'CAJAMARCA', 'CELENDIN', 'OXAMARCA');
INSERT INTO ubigeo VALUES (574639, 'CAJAMARCA', 'CELENDIN', 'SOROCHUCO');
INSERT INTO ubigeo VALUES (578641, 'CAJAMARCA', 'CONTUMAZA', 'CONTUMAZA');
INSERT INTO ubigeo VALUES (579643, 'CAJAMARCA', 'CONTUMAZA', 'CHILETE');
INSERT INTO ubigeo VALUES (580644, 'CAJAMARCA', 'CONTUMAZA', 'GUZMANGO');
INSERT INTO ubigeo VALUES (581420, 'AMAZONAS', 'LUYA', 'SANTO TOMAS');
INSERT INTO ubigeo VALUES (581645, 'CAJAMARCA', 'CONTUMAZA', 'SAN BENITO');
INSERT INTO ubigeo VALUES (582646, 'CAJAMARCA', 'CONTUMAZA', 'CUPISNIQUE');
INSERT INTO ubigeo VALUES (583647, 'CAJAMARCA', 'CONTUMAZA', 'TANTARICA');
INSERT INTO ubigeo VALUES (584648, 'CAJAMARCA', 'CONTUMAZA', 'YONAN');
INSERT INTO ubigeo VALUES (585649, 'CAJAMARCA', 'CONTUMAZA', 'STA CRUZ DE TOLEDO');
INSERT INTO ubigeo VALUES (586651, 'CAJAMARCA', 'CUTERVO', 'CUTERVO');
INSERT INTO ubigeo VALUES (587652, 'CAJAMARCA', 'CUTERVO', 'CALLAYUC');
INSERT INTO ubigeo VALUES (588653, 'CAJAMARCA', 'CUTERVO', 'CUJILLO');
INSERT INTO ubigeo VALUES (589654, 'CAJAMARCA', 'CUTERVO', 'CHOROS');
INSERT INTO ubigeo VALUES (590655, 'CAJAMARCA', 'CUTERVO', 'LA RAMADA');
INSERT INTO ubigeo VALUES (591421, 'AMAZONAS', 'LUYA', 'TINGO');
INSERT INTO ubigeo VALUES (591656, 'CAJAMARCA', 'CUTERVO', 'PIMPINGOS');
INSERT INTO ubigeo VALUES (592657, 'CAJAMARCA', 'CUTERVO', 'QUEROCOTILLO');
INSERT INTO ubigeo VALUES (593658, 'CAJAMARCA', 'CUTERVO', 'SAN ANDRES DE CUTERVO');
INSERT INTO ubigeo VALUES (594659, 'CAJAMARCA', 'CUTERVO', 'SAN JUAN DE CUTERVO');
INSERT INTO ubigeo VALUES (601422, 'AMAZONAS', 'LUYA', 'TRITA');
INSERT INTO ubigeo VALUES (601661, 'CAJAMARCA', 'CHOTA', 'CHOTA');
INSERT INTO ubigeo VALUES (602662, 'CAJAMARCA', 'CHOTA', 'ANGUIA');
INSERT INTO ubigeo VALUES (603663, 'CAJAMARCA', 'CHOTA', 'COCHABAMBA');
INSERT INTO ubigeo VALUES (604664, 'CAJAMARCA', 'CHOTA', 'CONCHAN');
INSERT INTO ubigeo VALUES (605665, 'CAJAMARCA', 'CHOTA', 'CHADIN');
INSERT INTO ubigeo VALUES (606666, 'CAJAMARCA', 'CHOTA', 'CHIGUIRIP');
INSERT INTO ubigeo VALUES (607667, 'CAJAMARCA', 'CHOTA', 'CHIMBAN');
INSERT INTO ubigeo VALUES (608668, 'CAJAMARCA', 'CHOTA', 'HUAMBOS');
INSERT INTO ubigeo VALUES (609669, 'CAJAMARCA', 'CHOTA', 'LAJAS');
INSERT INTO ubigeo VALUES (611423, 'AMAZONAS', 'LUYA', 'PROVIDENCIA');
INSERT INTO ubigeo VALUES (620671, 'CAJAMARCA', 'HUALGAYOC', 'BAMBAMARCA');
INSERT INTO ubigeo VALUES (621672, 'CAJAMARCA', 'HUALGAYOC', 'CHUGUR');
INSERT INTO ubigeo VALUES (622673, 'CAJAMARCA', 'HUALGAYOC', 'HUALGAYOC');
INSERT INTO ubigeo VALUES (623681, 'CAJAMARCA', 'JAEN', 'JAEN');
INSERT INTO ubigeo VALUES (624682, 'CAJAMARCA', 'JAEN', 'BELLAVISTA');
INSERT INTO ubigeo VALUES (625683, 'CAJAMARCA', 'JAEN', 'COLASAY');
INSERT INTO ubigeo VALUES (626684, 'CAJAMARCA', 'JAEN', 'CHONTALI');
INSERT INTO ubigeo VALUES (627685, 'CAJAMARCA', 'JAEN', 'POMAHUACA');
INSERT INTO ubigeo VALUES (628686, 'CAJAMARCA', 'JAEN', 'PUCARA');
INSERT INTO ubigeo VALUES (629687, 'CAJAMARCA', 'JAEN', 'SALLIQUE');
INSERT INTO ubigeo VALUES (630688, 'CAJAMARCA', 'JAEN', 'SAN FELIPE');
INSERT INTO ubigeo VALUES (631689, 'CAJAMARCA', 'JAEN', 'SAN JOSE DEL ALTO');
INSERT INTO ubigeo VALUES (635691, 'CAJAMARCA', 'SANTA CRUZ', 'SANTA CRUZ');
INSERT INTO ubigeo VALUES (636692, 'CAJAMARCA', 'SANTA CRUZ', 'CATACHE');
INSERT INTO ubigeo VALUES (637693, 'CAJAMARCA', 'SANTA CRUZ', 'CHANCAIBANOS');
INSERT INTO ubigeo VALUES (638694, 'CAJAMARCA', 'SANTA CRUZ', 'LA ESPERANZA');
INSERT INTO ubigeo VALUES (639695, 'CAJAMARCA', 'SANTA CRUZ', 'NINABAMBA');
INSERT INTO ubigeo VALUES (640696, 'CAJAMARCA', 'SANTA CRUZ', 'PULAN');
INSERT INTO ubigeo VALUES (641697, 'CAJAMARCA', 'SANTA CRUZ', 'SEXI');
INSERT INTO ubigeo VALUES (642698, 'CAJAMARCA', 'SANTA CRUZ', 'UTICYACU');
INSERT INTO ubigeo VALUES (643699, 'CAJAMARCA', 'SANTA CRUZ', 'YAUYUCAN');
INSERT INTO ubigeo VALUES (677711, 'CUSCO', 'CUSCO', 'CUSCO');
INSERT INTO ubigeo VALUES (678712, 'CUSCO', 'CUSCO', 'CCORCA');
INSERT INTO ubigeo VALUES (679713, 'CUSCO', 'CUSCO', 'POROY');
INSERT INTO ubigeo VALUES (680714, 'CUSCO', 'CUSCO', 'SAN JERONIMO');
INSERT INTO ubigeo VALUES (681715, 'CUSCO', 'CUSCO', 'SAN SEBASTIAN');
INSERT INTO ubigeo VALUES (682716, 'CUSCO', 'CUSCO', 'SANTIAGO');
INSERT INTO ubigeo VALUES (683717, 'CUSCO', 'CUSCO', 'SAYLLA');
INSERT INTO ubigeo VALUES (684718, 'CUSCO', 'CUSCO', 'WANCHAQ');
INSERT INTO ubigeo VALUES (685721, 'CUSCO', 'ACOMAYO', 'ACOMAYO');
INSERT INTO ubigeo VALUES (686722, 'CUSCO', 'ACOMAYO', 'ACOPIA');
INSERT INTO ubigeo VALUES (687723, 'CUSCO', 'ACOMAYO', 'ACOS');
INSERT INTO ubigeo VALUES (688724, 'CUSCO', 'ACOMAYO', 'POMACANCHI');
INSERT INTO ubigeo VALUES (689725, 'CUSCO', 'ACOMAYO', 'RONDOCAN');
INSERT INTO ubigeo VALUES (690726, 'CUSCO', 'ACOMAYO', 'SANGARARA');
INSERT INTO ubigeo VALUES (691727, 'CUSCO', 'ACOMAYO', 'MOSOC LLACTA');
INSERT INTO ubigeo VALUES (692731, 'CUSCO', 'ANTA', 'ANTA');
INSERT INTO ubigeo VALUES (693732, 'CUSCO', 'ANTA', 'CHINCHAYPUJIO');
INSERT INTO ubigeo VALUES (694733, 'CUSCO', 'ANTA', 'HUAROCONDO');
INSERT INTO ubigeo VALUES (695734, 'CUSCO', 'ANTA', 'LIMATAMBO');
INSERT INTO ubigeo VALUES (696735, 'CUSCO', 'ANTA', 'MOLLEPATA');
INSERT INTO ubigeo VALUES (697736, 'CUSCO', 'ANTA', 'PUCYURA');
INSERT INTO ubigeo VALUES (698737, 'CUSCO', 'ANTA', 'ZURITE');
INSERT INTO ubigeo VALUES (699738, 'CUSCO', 'ANTA', 'CACHIMAYO');
INSERT INTO ubigeo VALUES (700739, 'CUSCO', 'ANTA', 'ANCAHUASI');
INSERT INTO ubigeo VALUES (701741, 'CUSCO', 'CALCA', 'CALCA');
INSERT INTO ubigeo VALUES (702742, 'CUSCO', 'CALCA', 'COYA');
INSERT INTO ubigeo VALUES (703743, 'CUSCO', 'CALCA', 'LAMAY');
INSERT INTO ubigeo VALUES (704744, 'CUSCO', 'CALCA', 'LARES');
INSERT INTO ubigeo VALUES (705745, 'CUSCO', 'CALCA', 'PISAC');
INSERT INTO ubigeo VALUES (706746, 'CUSCO', 'CALCA', 'SAN SALVADOR');
INSERT INTO ubigeo VALUES (707747, 'CUSCO', 'CALCA', 'TARAY');
INSERT INTO ubigeo VALUES (708748, 'CUSCO', 'CALCA', 'YANATILE');
INSERT INTO ubigeo VALUES (709751, 'CUSCO', 'CANAS', 'YANAOCA');
INSERT INTO ubigeo VALUES (710752, 'CUSCO', 'CANAS', 'CHECCA');
INSERT INTO ubigeo VALUES (711510, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (711753, 'CUSCO', 'CANAS', 'KUNTURKANKI');
INSERT INTO ubigeo VALUES (712754, 'CUSCO', 'CANAS', 'LANGUI');
INSERT INTO ubigeo VALUES (713755, 'CUSCO', 'CANAS', 'LAYO');
INSERT INTO ubigeo VALUES (714756, 'CUSCO', 'CANAS', 'PAMPAMARCA');
INSERT INTO ubigeo VALUES (715757, 'CUSCO', 'CANAS', 'QUEHUE');
INSERT INTO ubigeo VALUES (716758, 'CUSCO', 'CANAS', 'TUPAC AMARU');
INSERT INTO ubigeo VALUES (717761, 'CUSCO', 'CANCHIS', 'SICUANI');
INSERT INTO ubigeo VALUES (718762, 'CUSCO', 'CANCHIS', 'COMBAPATA');
INSERT INTO ubigeo VALUES (719763, 'CUSCO', 'CANCHIS', 'CHECACUPE');
INSERT INTO ubigeo VALUES (720764, 'CUSCO', 'CANCHIS', 'MARANGANI');
INSERT INTO ubigeo VALUES (721511, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'TOTORA');
INSERT INTO ubigeo VALUES (721765, 'CUSCO', 'CANCHIS', 'PITUMARCA');
INSERT INTO ubigeo VALUES (722766, 'CUSCO', 'CANCHIS', 'SAN PABLO');
INSERT INTO ubigeo VALUES (723767, 'CUSCO', 'CANCHIS', 'SAN PEDRO');
INSERT INTO ubigeo VALUES (724768, 'CUSCO', 'CANCHIS', 'TINTA');
INSERT INTO ubigeo VALUES (725771, 'CUSCO', 'CHUMBIVILCAS', 'SANTO TOMAS');
INSERT INTO ubigeo VALUES (726772, 'CUSCO', 'CHUMBIVILCAS', 'CAPACMARCA');
INSERT INTO ubigeo VALUES (727773, 'CUSCO', 'CHUMBIVILCAS', 'COLQUEMARCA');
INSERT INTO ubigeo VALUES (728774, 'CUSCO', 'CHUMBIVILCAS', 'CHAMACA');
INSERT INTO ubigeo VALUES (729775, 'CUSCO', 'CHUMBIVILCAS', 'LIVITACA');
INSERT INTO ubigeo VALUES (730776, 'CUSCO', 'CHUMBIVILCAS', 'LLUSCO');
INSERT INTO ubigeo VALUES (731512, 'AMAZONAS', 'RODRIGUEZ DE MENDOZA', 'VISTA ALEGRE');
INSERT INTO ubigeo VALUES (731777, 'CUSCO', 'CHUMBIVILCAS', 'QUINOTA');
INSERT INTO ubigeo VALUES (732778, 'CUSCO', 'CHUMBIVILCAS', 'VELILLE');
INSERT INTO ubigeo VALUES (733781, 'CUSCO', 'ESPINAR', 'ESPINAR');
INSERT INTO ubigeo VALUES (734782, 'CUSCO', 'ESPINAR', 'CONDOROMA');
INSERT INTO ubigeo VALUES (735783, 'CUSCO', 'ESPINAR', 'COPORAQUE');
INSERT INTO ubigeo VALUES (736784, 'CUSCO', 'ESPINAR', 'OCORURO');
INSERT INTO ubigeo VALUES (737785, 'CUSCO', 'ESPINAR', 'PALLPATA');
INSERT INTO ubigeo VALUES (738786, 'CUSCO', 'ESPINAR', 'PICHIGUA');
INSERT INTO ubigeo VALUES (739787, 'CUSCO', 'ESPINAR', 'SUYKUTAMBO');
INSERT INTO ubigeo VALUES (740788, 'CUSCO', 'ESPINAR', 'ALTO PICHIGUA');
INSERT INTO ubigeo VALUES (741791, 'CUSCO', 'LA CONVENCION', 'SANTA ANA');
INSERT INTO ubigeo VALUES (742792, 'CUSCO', 'LA CONVENCION', 'ECHARATE');
INSERT INTO ubigeo VALUES (743793, 'CUSCO', 'LA CONVENCION', 'HUAYOPATA');
INSERT INTO ubigeo VALUES (744794, 'CUSCO', 'LA CONVENCION', 'MARANURA');
INSERT INTO ubigeo VALUES (745795, 'CUSCO', 'LA CONVENCION', 'OCOBAMBA');
INSERT INTO ubigeo VALUES (746796, 'CUSCO', 'LA CONVENCION', 'SANTA TERESA');
INSERT INTO ubigeo VALUES (747797, 'CUSCO', 'LA CONVENCION', 'VILCABAMBA');
INSERT INTO ubigeo VALUES (748798, 'CUSCO', 'LA CONVENCION', 'QUELLOUNO');
INSERT INTO ubigeo VALUES (749799, 'CUSCO', 'LA CONVENCION', 'KIMBIRI');
INSERT INTO ubigeo VALUES (785811, 'HUANCAVELICA', 'HUANCAVELICA', 'HUANCAVELICA');
INSERT INTO ubigeo VALUES (786812, 'HUANCAVELICA', 'HUANCAVELICA', 'ACOBAMBILLA');
INSERT INTO ubigeo VALUES (787813, 'HUANCAVELICA', 'HUANCAVELICA', 'ACORIA');
INSERT INTO ubigeo VALUES (788814, 'HUANCAVELICA', 'HUANCAVELICA', 'CONAYCA');
INSERT INTO ubigeo VALUES (789815, 'HUANCAVELICA', 'HUANCAVELICA', 'CUENCA');
INSERT INTO ubigeo VALUES (790816, 'HUANCAVELICA', 'HUANCAVELICA', 'HUACHOCOLPA');
INSERT INTO ubigeo VALUES (791818, 'HUANCAVELICA', 'HUANCAVELICA', 'HUAYLLAHUARA');
INSERT INTO ubigeo VALUES (792819, 'HUANCAVELICA', 'HUANCAVELICA', 'IZCUCHACA');
INSERT INTO ubigeo VALUES (804821, 'HUANCAVELICA', 'ACOBAMBA', 'ACOBAMBA');
INSERT INTO ubigeo VALUES (805822, 'HUANCAVELICA', 'ACOBAMBA', 'ANTA');
INSERT INTO ubigeo VALUES (806823, 'HUANCAVELICA', 'ACOBAMBA', 'ANDABAMBA');
INSERT INTO ubigeo VALUES (807824, 'HUANCAVELICA', 'ACOBAMBA', 'CAJA');
INSERT INTO ubigeo VALUES (808825, 'HUANCAVELICA', 'ACOBAMBA', 'MARCAS');
INSERT INTO ubigeo VALUES (809826, 'HUANCAVELICA', 'ACOBAMBA', 'PAUCARA');
INSERT INTO ubigeo VALUES (810827, 'HUANCAVELICA', 'ACOBAMBA', 'POMACOCHA');
INSERT INTO ubigeo VALUES (811828, 'HUANCAVELICA', 'ACOBAMBA', 'ROSARIO');
INSERT INTO ubigeo VALUES (812831, 'HUANCAVELICA', 'ANGARAES', 'LIRCAY');
INSERT INTO ubigeo VALUES (813832, 'HUANCAVELICA', 'ANGARAES', 'ANCHONGA');
INSERT INTO ubigeo VALUES (814833, 'HUANCAVELICA', 'ANGARAES', 'CALLANMARCA');
INSERT INTO ubigeo VALUES (815834, 'HUANCAVELICA', 'ANGARAES', 'CONGALLA');
INSERT INTO ubigeo VALUES (816835, 'HUANCAVELICA', 'ANGARAES', 'CHINCHO');
INSERT INTO ubigeo VALUES (817836, 'HUANCAVELICA', 'ANGARAES', 'HUAYLLAY GRANDE');
INSERT INTO ubigeo VALUES (818837, 'HUANCAVELICA', 'ANGARAES', 'HUANCA HUANCA');
INSERT INTO ubigeo VALUES (819838, 'HUANCAVELICA', 'ANGARAES', 'JULCAMARCA');
INSERT INTO ubigeo VALUES (820839, 'HUANCAVELICA', 'ANGARAES', 'SAN ANTONIO DE ANTAPARCO');
INSERT INTO ubigeo VALUES (824841, 'HUANCAVELICA', 'CASTROVIRREYNA', 'CASTROVIRREYNA');
INSERT INTO ubigeo VALUES (825842, 'HUANCAVELICA', 'CASTROVIRREYNA', 'ARMA');
INSERT INTO ubigeo VALUES (826843, 'HUANCAVELICA', 'CASTROVIRREYNA', 'AURAHUA');
INSERT INTO ubigeo VALUES (827845, 'HUANCAVELICA', 'CASTROVIRREYNA', 'CAPILLAS');
INSERT INTO ubigeo VALUES (828846, 'HUANCAVELICA', 'CASTROVIRREYNA', 'COCAS');
INSERT INTO ubigeo VALUES (829848, 'HUANCAVELICA', 'CASTROVIRREYNA', 'CHUPAMARCA');
INSERT INTO ubigeo VALUES (830849, 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUACHOS');
INSERT INTO ubigeo VALUES (837851, 'HUANCAVELICA', 'TAYACAJA', 'PAMPAS');
INSERT INTO ubigeo VALUES (838852, 'HUANCAVELICA', 'TAYACAJA', 'ACOSTAMBO');
INSERT INTO ubigeo VALUES (839853, 'HUANCAVELICA', 'TAYACAJA', 'ACRAQUIA');
INSERT INTO ubigeo VALUES (840854, 'HUANCAVELICA', 'TAYACAJA', 'AHUAYCHA');
INSERT INTO ubigeo VALUES (841856, 'HUANCAVELICA', 'TAYACAJA', 'COLCABAMBA');
INSERT INTO ubigeo VALUES (842859, 'HUANCAVELICA', 'TAYACAJA', 'DANIEL HERNANDEZ');
INSERT INTO ubigeo VALUES (853861, 'HUANCAVELICA', 'HUAYTARA', 'AYAVI');
INSERT INTO ubigeo VALUES (854862, 'HUANCAVELICA', 'HUAYTARA', 'CORDOVA');
INSERT INTO ubigeo VALUES (855863, 'HUANCAVELICA', 'HUAYTARA', 'HUAYACUNDO ARMA');
INSERT INTO ubigeo VALUES (856864, 'HUANCAVELICA', 'HUAYTARA', 'HUAYTARA');
INSERT INTO ubigeo VALUES (857865, 'HUANCAVELICA', 'HUAYTARA', 'LARAMARCA');
INSERT INTO ubigeo VALUES (858866, 'HUANCAVELICA', 'HUAYTARA', 'OCOYO');
INSERT INTO ubigeo VALUES (859867, 'HUANCAVELICA', 'HUAYTARA', 'PILPICHACA');
INSERT INTO ubigeo VALUES (860868, 'HUANCAVELICA', 'HUAYTARA', 'QUERCO');
INSERT INTO ubigeo VALUES (861869, 'HUANCAVELICA', 'HUAYTARA', 'QUITO ARMA');
INSERT INTO ubigeo VALUES (869871, 'HUANCAVELICA', 'CHURCAMPA', 'CHURCAMPA');
INSERT INTO ubigeo VALUES (870872, 'HUANCAVELICA', 'CHURCAMPA', 'ANCO');
INSERT INTO ubigeo VALUES (871873, 'HUANCAVELICA', 'CHURCAMPA', 'CHINCHIHUASI');
INSERT INTO ubigeo VALUES (872874, 'HUANCAVELICA', 'CHURCAMPA', 'EL CARMEN');
INSERT INTO ubigeo VALUES (873875, 'HUANCAVELICA', 'CHURCAMPA', 'LA MERCED');
INSERT INTO ubigeo VALUES (874876, 'HUANCAVELICA', 'CHURCAMPA', 'LOCROJA');
INSERT INTO ubigeo VALUES (875877, 'HUANCAVELICA', 'CHURCAMPA', 'PAUCARBAMBA');
INSERT INTO ubigeo VALUES (876878, 'HUANCAVELICA', 'CHURCAMPA', 'SAN MIGUEL DE MAYOC');
INSERT INTO ubigeo VALUES (877879, 'HUANCAVELICA', 'CHURCAMPA', 'SAN PEDRO DE CORIS');
INSERT INTO ubigeo VALUES (879911, 'HUANUCO', 'HUANUCO', 'HUANUCO');
INSERT INTO ubigeo VALUES (880912, 'HUANUCO', 'HUANUCO', 'CHINCHAO');
INSERT INTO ubigeo VALUES (881913, 'HUANUCO', 'HUANUCO', 'CHURUBAMBA');
INSERT INTO ubigeo VALUES (882914, 'HUANUCO', 'HUANUCO', 'MARGOS');
INSERT INTO ubigeo VALUES (883915, 'HUANUCO', 'HUANUCO', 'QUISQUI');
INSERT INTO ubigeo VALUES (884916, 'HUANUCO', 'HUANUCO', 'SAN FCO DE CAYRAN');
INSERT INTO ubigeo VALUES (885917, 'HUANUCO', 'HUANUCO', 'SAN PEDRO DE CHAULAN');
INSERT INTO ubigeo VALUES (886918, 'HUANUCO', 'HUANUCO', 'STA MARIA DEL VALLE');
INSERT INTO ubigeo VALUES (887919, 'HUANUCO', 'HUANUCO', 'YARUMAYO');
INSERT INTO ubigeo VALUES (890921, 'HUANUCO', 'AMBO', 'AMBO');
INSERT INTO ubigeo VALUES (891922, 'HUANUCO', 'AMBO', 'CAYNA');
INSERT INTO ubigeo VALUES (892923, 'HUANUCO', 'AMBO', 'COLPAS');
INSERT INTO ubigeo VALUES (893924, 'HUANUCO', 'AMBO', 'CONCHAMARCA');
INSERT INTO ubigeo VALUES (894925, 'HUANUCO', 'AMBO', 'HUACAR');
INSERT INTO ubigeo VALUES (895926, 'HUANUCO', 'AMBO', 'SAN FRANCISCO');
INSERT INTO ubigeo VALUES (896927, 'HUANUCO', 'AMBO', 'SAN RAFAEL');
INSERT INTO ubigeo VALUES (897928, 'HUANUCO', 'AMBO', 'TOMAY KICHWA');
INSERT INTO ubigeo VALUES (898931, 'HUANUCO', 'DOS DE MAYO', 'LA UNION');
INSERT INTO ubigeo VALUES (899937, 'HUANUCO', 'DOS DE MAYO', 'CHUQUIS');
INSERT INTO ubigeo VALUES (907941, 'HUANUCO', 'HUAMALIES', 'LLATA');
INSERT INTO ubigeo VALUES (908942, 'HUANUCO', 'HUAMALIES', 'ARANCAY');
INSERT INTO ubigeo VALUES (909943, 'HUANUCO', 'HUAMALIES', 'CHAVIN DE PARIARCA');
INSERT INTO ubigeo VALUES (910944, 'HUANUCO', 'HUAMALIES', 'JACAS GRANDE');
INSERT INTO ubigeo VALUES (911945, 'HUANUCO', 'HUAMALIES', 'JIRCAN');
INSERT INTO ubigeo VALUES (912946, 'HUANUCO', 'HUAMALIES', 'MIRAFLORES');
INSERT INTO ubigeo VALUES (913947, 'HUANUCO', 'HUAMALIES', 'MONZON');
INSERT INTO ubigeo VALUES (914948, 'HUANUCO', 'HUAMALIES', 'PUNCHAO');
INSERT INTO ubigeo VALUES (915949, 'HUANUCO', 'HUAMALIES', 'PUNOS');
INSERT INTO ubigeo VALUES (918951, 'HUANUCO', 'MARANON', 'HUACRACHUCO');
INSERT INTO ubigeo VALUES (919952, 'HUANUCO', 'MARANON', 'CHOLON');
INSERT INTO ubigeo VALUES (920955, 'HUANUCO', 'MARANON', 'SAN BUENAVENTURA');
INSERT INTO ubigeo VALUES (921961, 'HUANUCO', 'LEONCIO PRADO', 'RUPA RUPA');
INSERT INTO ubigeo VALUES (922962, 'HUANUCO', 'LEONCIO PRADO', 'DANIEL ALOMIA ROBLES');
INSERT INTO ubigeo VALUES (923963, 'HUANUCO', 'LEONCIO PRADO', 'HERMILIO VALDIZAN');
INSERT INTO ubigeo VALUES (924964, 'HUANUCO', 'LEONCIO PRADO', 'LUYANDO');
INSERT INTO ubigeo VALUES (925965, 'HUANUCO', 'LEONCIO PRADO', 'MARIANO DAMASO BERAUN');
INSERT INTO ubigeo VALUES (926966, 'HUANUCO', 'LEONCIO PRADO', 'JOSE CRESPO Y CASTILLO');
INSERT INTO ubigeo VALUES (927971, 'HUANUCO', 'PACHITEA', 'PANAO');
INSERT INTO ubigeo VALUES (928972, 'HUANUCO', 'PACHITEA', 'CHAGLLA');
INSERT INTO ubigeo VALUES (929974, 'HUANUCO', 'PACHITEA', 'MOLINO');
INSERT INTO ubigeo VALUES (930976, 'HUANUCO', 'PACHITEA', 'UMARI');
INSERT INTO ubigeo VALUES (931981, 'HUANUCO', 'PUERTO INCA', 'HONORIA');
INSERT INTO ubigeo VALUES (932110, 'ANCASH', 'HUARAZ', 'PARIACOTO');
INSERT INTO ubigeo VALUES (932982, 'HUANUCO', 'PUERTO INCA', 'PUERTO INCA');
INSERT INTO ubigeo VALUES (933983, 'HUANUCO', 'PUERTO INCA', 'CODO DEL POZUZO');
INSERT INTO ubigeo VALUES (934984, 'HUANUCO', 'PUERTO INCA', 'TOURNAVISTA');
INSERT INTO ubigeo VALUES (935985, 'HUANUCO', 'PUERTO INCA', 'YUYAPICHIS');
INSERT INTO ubigeo VALUES (936991, 'HUANUCO', 'HUACAYBAMBA', 'HUACAYBAMBA');
INSERT INTO ubigeo VALUES (937992, 'HUANUCO', 'HUACAYBAMBA', 'PINRA');
INSERT INTO ubigeo VALUES (938993, 'HUANUCO', 'HUACAYBAMBA', 'CANCHABAMBA');
INSERT INTO ubigeo VALUES (939994, 'HUANUCO', 'HUACAYBAMBA', 'COCHABAMBA');
INSERT INTO ubigeo VALUES (942111, 'ANCASH', 'HUARAZ', 'PIRA');
INSERT INTO ubigeo VALUES (952112, 'ANCASH', 'HUARAZ', 'TARICA');
INSERT INTO ubigeo VALUES (1052310, 'ANCASH', 'BOLOGNESI', 'HUAYLLACAYAN');
INSERT INTO ubigeo VALUES (1062311, 'ANCASH', 'BOLOGNESI', 'HUASTA');
INSERT INTO ubigeo VALUES (1072313, 'ANCASH', 'BOLOGNESI', 'MANGAS');
INSERT INTO ubigeo VALUES (1082315, 'ANCASH', 'BOLOGNESI', 'PACLLON');
INSERT INTO ubigeo VALUES (1092317, 'ANCASH', 'BOLOGNESI', 'SAN MIGUEL DE CORPANQUI');
INSERT INTO ubigeo VALUES (1102320, 'ANCASH', 'BOLOGNESI', 'TICLLOS');
INSERT INTO ubigeo VALUES (1112321, 'ANCASH', 'BOLOGNESI', 'ANTONIO RAIMONDI');
INSERT INTO ubigeo VALUES (1122322, 'ANCASH', 'BOLOGNESI', 'CANIS');
INSERT INTO ubigeo VALUES (1132323, 'ANCASH', 'BOLOGNESI', 'COLQUIOC');
INSERT INTO ubigeo VALUES (1142324, 'ANCASH', 'BOLOGNESI', 'LA PRIMAVERA');
INSERT INTO ubigeo VALUES (1152325, 'ANCASH', 'BOLOGNESI', 'HUALLANCA');
INSERT INTO ubigeo VALUES (1252410, 'ANCASH', 'CARHUAZ', 'TINCO');
INSERT INTO ubigeo VALUES (1262411, 'ANCASH', 'CARHUAZ', 'YUNGAR');
INSERT INTO ubigeo VALUES (1472710, 'ANCASH', 'HUAYLAS', 'SANTO TORIBIO');
INSERT INTO ubigeo VALUES (1572810, 'ANCASH', 'HUARI', 'PONTO');
INSERT INTO ubigeo VALUES (1582811, 'ANCASH', 'HUARI', 'RAHUAPAMPA');
INSERT INTO ubigeo VALUES (1592812, 'ANCASH', 'HUARI', 'RAPAYAN');
INSERT INTO ubigeo VALUES (1602813, 'ANCASH', 'HUARI', 'SAN MARCOS');
INSERT INTO ubigeo VALUES (1612814, 'ANCASH', 'HUARI', 'SAN PEDRO DE CHANA');
INSERT INTO ubigeo VALUES (1622815, 'ANCASH', 'HUARI', 'UCO');
INSERT INTO ubigeo VALUES (1632816, 'ANCASH', 'HUARI', 'ANRA');
INSERT INTO ubigeo VALUES (1722101, 'ANCASH', 'PALLASCA', 'CABANA');
INSERT INTO ubigeo VALUES (1732102, 'ANCASH', 'PALLASCA', 'BOLOGNESI');
INSERT INTO ubigeo VALUES (1742103, 'ANCASH', 'PALLASCA', 'CONCHUCOS');
INSERT INTO ubigeo VALUES (1752104, 'ANCASH', 'PALLASCA', 'HUACASCHUQUE');
INSERT INTO ubigeo VALUES (1762105, 'ANCASH', 'PALLASCA', 'HUANDOVAL');
INSERT INTO ubigeo VALUES (1772106, 'ANCASH', 'PALLASCA', 'LACABAMBA');
INSERT INTO ubigeo VALUES (1782107, 'ANCASH', 'PALLASCA', 'LLAPO');
INSERT INTO ubigeo VALUES (1792108, 'ANCASH', 'PALLASCA', 'PALLASCA');
INSERT INTO ubigeo VALUES (1802109, 'ANCASH', 'PALLASCA', 'PAMPAS');
INSERT INTO ubigeo VALUES (1832111, 'ANCASH', 'POMABAMBA', 'POMABAMBA');
INSERT INTO ubigeo VALUES (1834125, 'AMAZONAS', 'BAGUA', 'BAGUA');
INSERT INTO ubigeo VALUES (1842112, 'ANCASH', 'POMABAMBA', 'HUAYLLAN');
INSERT INTO ubigeo VALUES (1852113, 'ANCASH', 'POMABAMBA', 'PAROBAMBA');
INSERT INTO ubigeo VALUES (1862114, 'ANCASH', 'POMABAMBA', 'QUINUABAMBA');
INSERT INTO ubigeo VALUES (1872121, 'ANCASH', 'RECUAY', 'RECUAY');
INSERT INTO ubigeo VALUES (1882122, 'ANCASH', 'RECUAY', 'COTAPARACO');
INSERT INTO ubigeo VALUES (1892123, 'ANCASH', 'RECUAY', 'HUAYLLAPAMPA');
INSERT INTO ubigeo VALUES (1902124, 'ANCASH', 'RECUAY', 'MARCA');
INSERT INTO ubigeo VALUES (1912125, 'ANCASH', 'RECUAY', 'PAMPAS CHICO');
INSERT INTO ubigeo VALUES (1922126, 'ANCASH', 'RECUAY', 'PARARIN');
INSERT INTO ubigeo VALUES (1932127, 'ANCASH', 'RECUAY', 'TAPACOCHA');
INSERT INTO ubigeo VALUES (1942128, 'ANCASH', 'RECUAY', 'TICAPAMPA');
INSERT INTO ubigeo VALUES (1952129, 'ANCASH', 'RECUAY', 'LLACLLIN');
INSERT INTO ubigeo VALUES (1972131, 'ANCASH', 'SANTA', 'CHIMBOTE');
INSERT INTO ubigeo VALUES (1982132, 'ANCASH', 'SANTA', 'CACERES DEL PERU');
INSERT INTO ubigeo VALUES (1992133, 'ANCASH', 'SANTA', 'MACATE');
INSERT INTO ubigeo VALUES (2002134, 'ANCASH', 'SANTA', 'MORO');
INSERT INTO ubigeo VALUES (2012135, 'ANCASH', 'SANTA', 'NEPENA');
INSERT INTO ubigeo VALUES (2022136, 'ANCASH', 'SANTA', 'SAMANCO');
INSERT INTO ubigeo VALUES (2032137, 'ANCASH', 'SANTA', 'SANTA');
INSERT INTO ubigeo VALUES (2042138, 'ANCASH', 'SANTA', 'COISHCO');
INSERT INTO ubigeo VALUES (2052139, 'ANCASH', 'SANTA', 'NUEVO CHIMBOTE');
INSERT INTO ubigeo VALUES (2062141, 'ANCASH', 'SIHUAS', 'SIHUAS');
INSERT INTO ubigeo VALUES (2072142, 'ANCASH', 'SIHUAS', 'ALFONSO UGARTE');
INSERT INTO ubigeo VALUES (2082143, 'ANCASH', 'SIHUAS', 'CHINGALPO');
INSERT INTO ubigeo VALUES (2092144, 'ANCASH', 'SIHUAS', 'HUAYLLABAMBA');
INSERT INTO ubigeo VALUES (2102145, 'ANCASH', 'SIHUAS', 'QUICHES');
INSERT INTO ubigeo VALUES (2112146, 'ANCASH', 'SIHUAS', 'SICSIBAMBA');
INSERT INTO ubigeo VALUES (2122147, 'ANCASH', 'SIHUAS', 'ACOBAMBA');
INSERT INTO ubigeo VALUES (2132148, 'ANCASH', 'SIHUAS', 'CASHAPAMPA');
INSERT INTO ubigeo VALUES (2142149, 'ANCASH', 'SIHUAS', 'RAGASH');
INSERT INTO ubigeo VALUES (2162151, 'ANCASH', 'YUNGAY', 'YUNGAY');
INSERT INTO ubigeo VALUES (2172152, 'ANCASH', 'YUNGAY', 'CASCAPARA');
INSERT INTO ubigeo VALUES (2182153, 'ANCASH', 'YUNGAY', 'MANCOS');
INSERT INTO ubigeo VALUES (2192154, 'ANCASH', 'YUNGAY', 'MATACOTO');
INSERT INTO ubigeo VALUES (2202155, 'ANCASH', 'YUNGAY', 'QUILLO');
INSERT INTO ubigeo VALUES (2212156, 'ANCASH', 'YUNGAY', 'RANRAHIRCA');
INSERT INTO ubigeo VALUES (2222157, 'ANCASH', 'YUNGAY', 'SHUPLUY');
INSERT INTO ubigeo VALUES (2232158, 'ANCASH', 'YUNGAY', 'YANAMA');
INSERT INTO ubigeo VALUES (2242161, 'ANCASH', 'ANTONIO RAIMONDI', 'LLAMELLIN');
INSERT INTO ubigeo VALUES (2252162, 'ANCASH', 'ANTONIO RAIMONDI', 'ACZO');
INSERT INTO ubigeo VALUES (2262163, 'ANCASH', 'ANTONIO RAIMONDI', 'CHACCHO');
INSERT INTO ubigeo VALUES (2272164, 'ANCASH', 'ANTONIO RAIMONDI', 'CHINGAS');
INSERT INTO ubigeo VALUES (2282165, 'ANCASH', 'ANTONIO RAIMONDI', 'MIRGAS');
INSERT INTO ubigeo VALUES (2292166, 'ANCASH', 'ANTONIO RAIMONDI', 'SAN JUAN DE RONTOY');
INSERT INTO ubigeo VALUES (2302171, 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN LUIS');
INSERT INTO ubigeo VALUES (2312172, 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'YAUYA');
INSERT INTO ubigeo VALUES (2322173, 'ANCASH', 'CARLOS FERMIN FITZCARRALD', 'SAN NICOLAS');
INSERT INTO ubigeo VALUES (2332181, 'ANCASH', 'ASUNCION', 'CHACAS');
INSERT INTO ubigeo VALUES (2342182, 'ANCASH', 'ASUNCION', 'ACOCHACA');
INSERT INTO ubigeo VALUES (2352191, 'ANCASH', 'HUARMEY', 'HUARMEY');
INSERT INTO ubigeo VALUES (2362192, 'ANCASH', 'HUARMEY', 'COCHAPETI');
INSERT INTO ubigeo VALUES (2372193, 'ANCASH', 'HUARMEY', 'HUAYAN');
INSERT INTO ubigeo VALUES (2382194, 'ANCASH', 'HUARMEY', 'MALVAS');
INSERT INTO ubigeo VALUES (2392195, 'ANCASH', 'HUARMEY', 'CULEBRAS');
INSERT INTO ubigeo VALUES (2402201, 'ANCASH', 'OCROS', 'ACAS');
INSERT INTO ubigeo VALUES (2412202, 'ANCASH', 'OCROS', 'CAJAMARQUILLA');
INSERT INTO ubigeo VALUES (2422203, 'ANCASH', 'OCROS', 'CARHUAPAMPA');
INSERT INTO ubigeo VALUES (2432204, 'ANCASH', 'OCROS', 'COCHAS');
INSERT INTO ubigeo VALUES (2442205, 'ANCASH', 'OCROS', 'CONGAS');
INSERT INTO ubigeo VALUES (2452206, 'ANCASH', 'OCROS', 'LLIPA');
INSERT INTO ubigeo VALUES (2462207, 'ANCASH', 'OCROS', 'OCROS');
INSERT INTO ubigeo VALUES (2472208, 'ANCASH', 'OCROS', 'SAN CRISTOBAL DE RAJAN');
INSERT INTO ubigeo VALUES (2482209, 'ANCASH', 'OCROS', 'SAN PEDRO');
INSERT INTO ubigeo VALUES (2683210, 'APURIMAC', 'AYMARAES', 'SANAICA');
INSERT INTO ubigeo VALUES (2693211, 'APURIMAC', 'AYMARAES', 'SORAYA');
INSERT INTO ubigeo VALUES (2703212, 'APURIMAC', 'AYMARAES', 'TAPAIRIHUA');
INSERT INTO ubigeo VALUES (2713213, 'APURIMAC', 'AYMARAES', 'TINTAY');
INSERT INTO ubigeo VALUES (2723214, 'APURIMAC', 'AYMARAES', 'TORAYA');
INSERT INTO ubigeo VALUES (2733215, 'APURIMAC', 'AYMARAES', 'YANACA');
INSERT INTO ubigeo VALUES (2743216, 'APURIMAC', 'AYMARAES', 'SAN JUAN DE CHACNA');
INSERT INTO ubigeo VALUES (2753217, 'APURIMAC', 'AYMARAES', 'JUSTO APU SAHUARAURA');
INSERT INTO ubigeo VALUES (2853310, 'APURIMAC', 'ANDAHUAYLAS', 'SAN JERONIMO');
INSERT INTO ubigeo VALUES (2863311, 'APURIMAC', 'ANDAHUAYLAS', 'TALAVERA');
INSERT INTO ubigeo VALUES (2873312, 'APURIMAC', 'ANDAHUAYLAS', 'TURPO');
INSERT INTO ubigeo VALUES (2883313, 'APURIMAC', 'ANDAHUAYLAS', 'PACUCHA');
INSERT INTO ubigeo VALUES (2893314, 'APURIMAC', 'ANDAHUAYLAS', 'POMACOCHA');
INSERT INTO ubigeo VALUES (2903315, 'APURIMAC', 'ANDAHUAYLAS', 'STA MARIA DE CHICMO');
INSERT INTO ubigeo VALUES (2913316, 'APURIMAC', 'ANDAHUAYLAS', 'TUMAY HUARACA');
INSERT INTO ubigeo VALUES (2923317, 'APURIMAC', 'ANDAHUAYLAS', 'HUAYANA');
INSERT INTO ubigeo VALUES (2933318, 'APURIMAC', 'ANDAHUAYLAS', 'SAN MIGUEL DE CHACCRAMPA');
INSERT INTO ubigeo VALUES (2943319, 'APURIMAC', 'ANDAHUAYLAS', 'KAQUIABAMBA');
INSERT INTO ubigeo VALUES (3173610, 'APURIMAC', 'GRAU', 'TURPAY');
INSERT INTO ubigeo VALUES (3183611, 'APURIMAC', 'GRAU', 'VILCABAMBA');
INSERT INTO ubigeo VALUES (3193612, 'APURIMAC', 'GRAU', 'VIRUNDO');
INSERT INTO ubigeo VALUES (3203613, 'APURIMAC', 'GRAU', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (3213614, 'APURIMAC', 'GRAU', 'CURASCO');
INSERT INTO ubigeo VALUES (3394110, 'AREQUIPA', 'AREQUIPA', 'POCSI');
INSERT INTO ubigeo VALUES (3404111, 'AREQUIPA', 'AREQUIPA', 'POLOBAYA');
INSERT INTO ubigeo VALUES (3414112, 'AREQUIPA', 'AREQUIPA', 'QUEQUENA');
INSERT INTO ubigeo VALUES (3424113, 'AREQUIPA', 'AREQUIPA', 'SABANDIA');
INSERT INTO ubigeo VALUES (3434114, 'AREQUIPA', 'AREQUIPA', 'SACHACA');
INSERT INTO ubigeo VALUES (3444115, 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE SIGUAS');
INSERT INTO ubigeo VALUES (3454116, 'AREQUIPA', 'AREQUIPA', 'SAN JUAN DE TARUCANI');
INSERT INTO ubigeo VALUES (3464117, 'AREQUIPA', 'AREQUIPA', 'SANTA ISABEL DE SIGUAS');
INSERT INTO ubigeo VALUES (3474118, 'AREQUIPA', 'AREQUIPA', 'STA RITA DE SIGUAS');
INSERT INTO ubigeo VALUES (3484119, 'AREQUIPA', 'AREQUIPA', 'SOCABAYA');
INSERT INTO ubigeo VALUES (3494120, 'AREQUIPA', 'AREQUIPA', 'TIABAYA');
INSERT INTO ubigeo VALUES (3504121, 'AREQUIPA', 'AREQUIPA', 'UCHUMAYO');
INSERT INTO ubigeo VALUES (3514122, 'AREQUIPA', 'AREQUIPA', 'VITOR');
INSERT INTO ubigeo VALUES (3524123, 'AREQUIPA', 'AREQUIPA', 'YANAHUARA');
INSERT INTO ubigeo VALUES (3534124, 'AREQUIPA', 'AREQUIPA', 'YARABAMBA');
INSERT INTO ubigeo VALUES (3544125, 'AREQUIPA', 'AREQUIPA', 'YURA');
INSERT INTO ubigeo VALUES (3554126, 'AREQUIPA', 'AREQUIPA', 'MARIANO MELGAR');
INSERT INTO ubigeo VALUES (3564127, 'AREQUIPA', 'AREQUIPA', 'JACOBO HUNTER');
INSERT INTO ubigeo VALUES (3574128, 'AREQUIPA', 'AREQUIPA', 'ALTO SELVA ALEGRE');
INSERT INTO ubigeo VALUES (3584129, 'AREQUIPA', 'AREQUIPA', 'JOSE LUIS BUSTAMANTE Y RIVERO');
INSERT INTO ubigeo VALUES (3684210, 'AREQUIPA', 'CAYLLOMA', 'LARI');
INSERT INTO ubigeo VALUES (3694211, 'AREQUIPA', 'CAYLLOMA', 'LLUTA');
INSERT INTO ubigeo VALUES (3704212, 'AREQUIPA', 'CAYLLOMA', 'MACA');
INSERT INTO ubigeo VALUES (3714213, 'AREQUIPA', 'CAYLLOMA', 'MADRIGAL');
INSERT INTO ubigeo VALUES (3724214, 'AREQUIPA', 'CAYLLOMA', 'SAN ANTONIO DE CHUCA');
INSERT INTO ubigeo VALUES (3734215, 'AREQUIPA', 'CAYLLOMA', 'SIBAYO');
INSERT INTO ubigeo VALUES (3744216, 'AREQUIPA', 'CAYLLOMA', 'TAPAY');
INSERT INTO ubigeo VALUES (3754217, 'AREQUIPA', 'CAYLLOMA', 'TISCO');
INSERT INTO ubigeo VALUES (3764218, 'AREQUIPA', 'CAYLLOMA', 'TUTI');
INSERT INTO ubigeo VALUES (3774219, 'AREQUIPA', 'CAYLLOMA', 'YANQUE');
INSERT INTO ubigeo VALUES (3784220, 'AREQUIPA', 'CAYLLOMA', 'MAJES');
INSERT INTO ubigeo VALUES (3964410, 'AREQUIPA', 'CARAVELI', 'JAQUI');
INSERT INTO ubigeo VALUES (3974411, 'AREQUIPA', 'CARAVELI', 'LOMAS');
INSERT INTO ubigeo VALUES (3984412, 'AREQUIPA', 'CARAVELI', 'QUICACHA');
INSERT INTO ubigeo VALUES (3994413, 'AREQUIPA', 'CARAVELI', 'YAUCA');
INSERT INTO ubigeo VALUES (4094510, 'AREQUIPA', 'CASTILLA', 'PAMPACOLCA');
INSERT INTO ubigeo VALUES (4104511, 'AREQUIPA', 'CASTILLA', 'TIPAN');
INSERT INTO ubigeo VALUES (4114512, 'AREQUIPA', 'CASTILLA', 'URACA');
INSERT INTO ubigeo VALUES (4124513, 'AREQUIPA', 'CASTILLA', 'UNON');
INSERT INTO ubigeo VALUES (4134514, 'AREQUIPA', 'CASTILLA', 'VIRACO');
INSERT INTO ubigeo VALUES (4374810, 'AREQUIPA', 'LA UNION', 'TOMEPAMPA');
INSERT INTO ubigeo VALUES (4384811, 'AREQUIPA', 'LA UNION', 'TORO');
INSERT INTO ubigeo VALUES (4485110, 'AYACUCHO', 'HUAMANGA', 'TAMBILLO');
INSERT INTO ubigeo VALUES (4495111, 'AYACUCHO', 'HUAMANGA', 'ACOCRO');
INSERT INTO ubigeo VALUES (4505112, 'AYACUCHO', 'HUAMANGA', 'SOCOS');
INSERT INTO ubigeo VALUES (4515113, 'AYACUCHO', 'HUAMANGA', 'OCROS');
INSERT INTO ubigeo VALUES (4525114, 'AYACUCHO', 'HUAMANGA', 'PACAYCASA');
INSERT INTO ubigeo VALUES (4535115, 'AYACUCHO', 'HUAMANGA', 'JESUS NAZARENO');
INSERT INTO ubigeo VALUES (4595211, 'AYACUCHO', 'CANGALLO', 'MARIA PARADO DE BELLIDO');
INSERT INTO ubigeo VALUES (4825510, 'AYACUCHO', 'LUCANAS', 'HUAC-HUAS');
INSERT INTO ubigeo VALUES (4835511, 'AYACUCHO', 'LUCANAS', 'LARAMATE');
INSERT INTO ubigeo VALUES (4845512, 'AYACUCHO', 'LUCANAS', 'LEONCIO PRADO');
INSERT INTO ubigeo VALUES (4855513, 'AYACUCHO', 'LUCANAS', 'LUCANAS');
INSERT INTO ubigeo VALUES (4865514, 'AYACUCHO', 'LUCANAS', 'LLAUTA');
INSERT INTO ubigeo VALUES (4875516, 'AYACUCHO', 'LUCANAS', 'OCANA');
INSERT INTO ubigeo VALUES (4885517, 'AYACUCHO', 'LUCANAS', 'OTOCA');
INSERT INTO ubigeo VALUES (4895520, 'AYACUCHO', 'LUCANAS', 'SANCOS');
INSERT INTO ubigeo VALUES (4905521, 'AYACUCHO', 'LUCANAS', 'SAN JUAN');
INSERT INTO ubigeo VALUES (4915522, 'AYACUCHO', 'LUCANAS', 'SAN PEDRO');
INSERT INTO ubigeo VALUES (4925524, 'AYACUCHO', 'LUCANAS', 'STA ANA DE HUAYCAHUACHO');
INSERT INTO ubigeo VALUES (4935525, 'AYACUCHO', 'LUCANAS', 'SANTA LUCIA');
INSERT INTO ubigeo VALUES (4945529, 'AYACUCHO', 'LUCANAS', 'SAISA');
INSERT INTO ubigeo VALUES (4955531, 'AYACUCHO', 'LUCANAS', 'SAN PEDRO DE PALCO');
INSERT INTO ubigeo VALUES (4965532, 'AYACUCHO', 'LUCANAS', 'SAN CRISTOBAL');
INSERT INTO ubigeo VALUES (5015611, 'AYACUCHO', 'PARINACOCHAS', 'PULLO');
INSERT INTO ubigeo VALUES (5025612, 'AYACUCHO', 'PARINACOCHAS', 'PUYUSCA');
INSERT INTO ubigeo VALUES (5035615, 'AYACUCHO', 'PARINACOCHAS', 'SAN FCO DE RAVACAYCO');
INSERT INTO ubigeo VALUES (5045616, 'AYACUCHO', 'PARINACOCHAS', 'UPAHUACHO');
INSERT INTO ubigeo VALUES (5135710, 'AYACUCHO', 'VICTOR FAJARDO', 'HUANCARAYLLA');
INSERT INTO ubigeo VALUES (5145713, 'AYACUCHO', 'VICTOR FAJARDO', 'SARHUA');
INSERT INTO ubigeo VALUES (5155714, 'AYACUCHO', 'VICTOR FAJARDO', 'VILCANCHOS');
INSERT INTO ubigeo VALUES (5165715, 'AYACUCHO', 'VICTOR FAJARDO', 'ASQUIPATA');
INSERT INTO ubigeo VALUES (5295101, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PAUSA');
INSERT INTO ubigeo VALUES (5305102, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'COLTA');
INSERT INTO ubigeo VALUES (5315103, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'CORCULLA');
INSERT INTO ubigeo VALUES (5325104, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'LAMPA');
INSERT INTO ubigeo VALUES (5335105, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'MARCABAMBA');
INSERT INTO ubigeo VALUES (5345106, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'OYOLO');
INSERT INTO ubigeo VALUES (5355107, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'PARARCA');
INSERT INTO ubigeo VALUES (5365108, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JAVIER DE ALPABAMBA');
INSERT INTO ubigeo VALUES (5375109, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SAN JOSE DE USHUA');
INSERT INTO ubigeo VALUES (5395111, 'AYACUCHO', 'SUCRE', 'QUEROBAMBA');
INSERT INTO ubigeo VALUES (5405112, 'AYACUCHO', 'SUCRE', 'BELEN');
INSERT INTO ubigeo VALUES (5415113, 'AYACUCHO', 'SUCRE', 'CHALCOS');
INSERT INTO ubigeo VALUES (5425114, 'AYACUCHO', 'SUCRE', 'SAN SALVADOR DE QUIJE');
INSERT INTO ubigeo VALUES (5435115, 'AYACUCHO', 'SUCRE', 'PAICO');
INSERT INTO ubigeo VALUES (5445116, 'AYACUCHO', 'SUCRE', 'SANTIAGO DE PAUCARAY');
INSERT INTO ubigeo VALUES (5455117, 'AYACUCHO', 'SUCRE', 'SAN PEDRO DE LARCAY');
INSERT INTO ubigeo VALUES (5465118, 'AYACUCHO', 'SUCRE', 'SORAS');
INSERT INTO ubigeo VALUES (5475119, 'AYACUCHO', 'SUCRE', 'HUACANA');
INSERT INTO ubigeo VALUES (5596110, 'CAJAMARCA', 'CAJAMARCA', 'MATARA');
INSERT INTO ubigeo VALUES (5606111, 'CAJAMARCA', 'CAJAMARCA', 'NAMORA');
INSERT INTO ubigeo VALUES (5616112, 'CAJAMARCA', 'CAJAMARCA', 'SAN JUAN');
INSERT INTO ubigeo VALUES (5756310, 'CAJAMARCA', 'CELENDIN', 'SUCRE');
INSERT INTO ubigeo VALUES (5766311, 'CAJAMARCA', 'CELENDIN', 'UTCO');
INSERT INTO ubigeo VALUES (5776312, 'CAJAMARCA', 'CELENDIN', 'LA LIBERTAD DE PALLAN');
INSERT INTO ubigeo VALUES (5956510, 'CAJAMARCA', 'CUTERVO', 'SAN LUIS DE LUCMA');
INSERT INTO ubigeo VALUES (5966511, 'CAJAMARCA', 'CUTERVO', 'SANTA CRUZ');
INSERT INTO ubigeo VALUES (5976512, 'CAJAMARCA', 'CUTERVO', 'SANTO DOMINGO DE LA CAPILLA');
INSERT INTO ubigeo VALUES (5986513, 'CAJAMARCA', 'CUTERVO', 'SANTO TOMAS');
INSERT INTO ubigeo VALUES (5996514, 'CAJAMARCA', 'CUTERVO', 'SOCOTA');
INSERT INTO ubigeo VALUES (6006515, 'CAJAMARCA', 'CUTERVO', 'TORIBIO CASANOVA');
INSERT INTO ubigeo VALUES (6106610, 'CAJAMARCA', 'CHOTA', 'LLAMA');
INSERT INTO ubigeo VALUES (6116611, 'CAJAMARCA', 'CHOTA', 'MIRACOSTA');
INSERT INTO ubigeo VALUES (6126612, 'CAJAMARCA', 'CHOTA', 'PACCHA');
INSERT INTO ubigeo VALUES (6136613, 'CAJAMARCA', 'CHOTA', 'PION');
INSERT INTO ubigeo VALUES (6146614, 'CAJAMARCA', 'CHOTA', 'QUEROCOTO');
INSERT INTO ubigeo VALUES (6156615, 'CAJAMARCA', 'CHOTA', 'TACABAMBA');
INSERT INTO ubigeo VALUES (6166616, 'CAJAMARCA', 'CHOTA', 'TOCMOCHE');
INSERT INTO ubigeo VALUES (6176617, 'CAJAMARCA', 'CHOTA', 'SAN JUAN DE LICUPIS');
INSERT INTO ubigeo VALUES (6186618, 'CAJAMARCA', 'CHOTA', 'CHOROPAMPA');
INSERT INTO ubigeo VALUES (6196619, 'CAJAMARCA', 'CHOTA', 'CHALAMARCA');
INSERT INTO ubigeo VALUES (6326810, 'CAJAMARCA', 'JAEN', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (6336811, 'CAJAMARCA', 'JAEN', 'LAS PIRIAS');
INSERT INTO ubigeo VALUES (6346812, 'CAJAMARCA', 'JAEN', 'HUABAL');
INSERT INTO ubigeo VALUES (6446910, 'CAJAMARCA', 'SANTA CRUZ', 'ANDABAMBA');
INSERT INTO ubigeo VALUES (6456911, 'CAJAMARCA', 'SANTA CRUZ', 'SAUCEPAMPA');
INSERT INTO ubigeo VALUES (6466101, 'CAJAMARCA', 'SAN MIGUEL', 'SAN MIGUEL');
INSERT INTO ubigeo VALUES (6476102, 'CAJAMARCA', 'SAN MIGUEL', 'CALQUIS');
INSERT INTO ubigeo VALUES (6486103, 'CAJAMARCA', 'SAN MIGUEL', 'LA FLORIDA');
INSERT INTO ubigeo VALUES (6496104, 'CAJAMARCA', 'SAN MIGUEL', 'LLAPA');
INSERT INTO ubigeo VALUES (6506105, 'CAJAMARCA', 'SAN MIGUEL', 'NANCHOC');
INSERT INTO ubigeo VALUES (6516106, 'CAJAMARCA', 'SAN MIGUEL', 'NIEPOS');
INSERT INTO ubigeo VALUES (6526107, 'CAJAMARCA', 'SAN MIGUEL', 'SAN GREGORIO');
INSERT INTO ubigeo VALUES (6536108, 'CAJAMARCA', 'SAN MIGUEL', 'SAN SILVESTRE DE COCHAN');
INSERT INTO ubigeo VALUES (6546109, 'CAJAMARCA', 'SAN MIGUEL', 'EL PRADO');
INSERT INTO ubigeo VALUES (6596111, 'CAJAMARCA', 'SAN IGNACIO', 'SAN IGNACIO');
INSERT INTO ubigeo VALUES (6606112, 'CAJAMARCA', 'SAN IGNACIO', 'CHIRINOS');
INSERT INTO ubigeo VALUES (6616113, 'CAJAMARCA', 'SAN IGNACIO', 'HUARANGO');
INSERT INTO ubigeo VALUES (6626114, 'CAJAMARCA', 'SAN IGNACIO', 'NAMBALLE');
INSERT INTO ubigeo VALUES (6636115, 'CAJAMARCA', 'SAN IGNACIO', 'LA COIPA');
INSERT INTO ubigeo VALUES (6646116, 'CAJAMARCA', 'SAN IGNACIO', 'SAN JOSE DE LOURDES');
INSERT INTO ubigeo VALUES (6656117, 'CAJAMARCA', 'SAN IGNACIO', 'TABACONAS');
INSERT INTO ubigeo VALUES (6666121, 'CAJAMARCA', 'SAN MARCOS', 'PEDRO GALVEZ');
INSERT INTO ubigeo VALUES (6676122, 'CAJAMARCA', 'SAN MARCOS', 'ICHOCAN');
INSERT INTO ubigeo VALUES (6686123, 'CAJAMARCA', 'SAN MARCOS', 'GREGORIO PITA');
INSERT INTO ubigeo VALUES (6696124, 'CAJAMARCA', 'SAN MARCOS', 'JOSE MANUEL QUIROZ');
INSERT INTO ubigeo VALUES (6706125, 'CAJAMARCA', 'SAN MARCOS', 'EDUARDO VILLANUEVA');
INSERT INTO ubigeo VALUES (6716126, 'CAJAMARCA', 'SAN MARCOS', 'JOSE SABOGAL');
INSERT INTO ubigeo VALUES (6726127, 'CAJAMARCA', 'SAN MARCOS', 'CHANCAY');
INSERT INTO ubigeo VALUES (6736131, 'CAJAMARCA', 'SAN PABLO', 'SAN PABLO');
INSERT INTO ubigeo VALUES (6746132, 'CAJAMARCA', 'SAN PABLO', 'SAN BERNARDINO');
INSERT INTO ubigeo VALUES (6756133, 'CAJAMARCA', 'SAN PABLO', 'SAN LUIS');
INSERT INTO ubigeo VALUES (6766134, 'CAJAMARCA', 'SAN PABLO', 'TUMBADEN');
INSERT INTO ubigeo VALUES (7507910, 'CUSCO', 'LA CONVENCION', 'PICHARI');
INSERT INTO ubigeo VALUES (7517101, 'CUSCO', 'PARURO', 'PARURO');
INSERT INTO ubigeo VALUES (7527102, 'CUSCO', 'PARURO', 'ACCHA');
INSERT INTO ubigeo VALUES (7537103, 'CUSCO', 'PARURO', 'CCAPI');
INSERT INTO ubigeo VALUES (7547104, 'CUSCO', 'PARURO', 'COLCHA');
INSERT INTO ubigeo VALUES (7557105, 'CUSCO', 'PARURO', 'HUANOQUITE');
INSERT INTO ubigeo VALUES (7567106, 'CUSCO', 'PARURO', 'OMACHA');
INSERT INTO ubigeo VALUES (7577107, 'CUSCO', 'PARURO', 'YAURISQUE');
INSERT INTO ubigeo VALUES (7587108, 'CUSCO', 'PARURO', 'PACCARITAMBO');
INSERT INTO ubigeo VALUES (7597109, 'CUSCO', 'PARURO', 'PILLPINTO');
INSERT INTO ubigeo VALUES (7607111, 'CUSCO', 'PAUCARTAMBO', 'PAUCARTAMBO');
INSERT INTO ubigeo VALUES (7617112, 'CUSCO', 'PAUCARTAMBO', 'CAICAY');
INSERT INTO ubigeo VALUES (7627113, 'CUSCO', 'PAUCARTAMBO', 'COLQUEPATA');
INSERT INTO ubigeo VALUES (7637114, 'CUSCO', 'PAUCARTAMBO', 'CHALLABAMBA');
INSERT INTO ubigeo VALUES (7647115, 'CUSCO', 'PAUCARTAMBO', 'COSNIPATA');
INSERT INTO ubigeo VALUES (7657116, 'CUSCO', 'PAUCARTAMBO', 'HUANCARANI');
INSERT INTO ubigeo VALUES (7667121, 'CUSCO', 'QUISPICANCHI', 'URCOS');
INSERT INTO ubigeo VALUES (7677122, 'CUSCO', 'QUISPICANCHI', 'ANDAHUAYLILLAS');
INSERT INTO ubigeo VALUES (7687123, 'CUSCO', 'QUISPICANCHI', 'CAMANTI');
INSERT INTO ubigeo VALUES (7697124, 'CUSCO', 'QUISPICANCHI', 'CCARHUAYO');
INSERT INTO ubigeo VALUES (7707125, 'CUSCO', 'QUISPICANCHI', 'CCATCA');
INSERT INTO ubigeo VALUES (7717126, 'CUSCO', 'QUISPICANCHI', 'CUSIPATA');
INSERT INTO ubigeo VALUES (7727127, 'CUSCO', 'QUISPICANCHI', 'HUARO');
INSERT INTO ubigeo VALUES (7737128, 'CUSCO', 'QUISPICANCHI', 'LUCRE');
INSERT INTO ubigeo VALUES (7747129, 'CUSCO', 'QUISPICANCHI', 'MARCAPATA');
INSERT INTO ubigeo VALUES (7787131, 'CUSCO', 'URUBAMBA', 'URUBAMBA');
INSERT INTO ubigeo VALUES (7797132, 'CUSCO', 'URUBAMBA', 'CHINCHERO');
INSERT INTO ubigeo VALUES (7807133, 'CUSCO', 'URUBAMBA', 'HUAYLLABAMBA');
INSERT INTO ubigeo VALUES (7817134, 'CUSCO', 'URUBAMBA', 'MACHUPICCHU');
INSERT INTO ubigeo VALUES (7827135, 'CUSCO', 'URUBAMBA', 'MARAS');
INSERT INTO ubigeo VALUES (7837136, 'CUSCO', 'URUBAMBA', 'OLLANTAYTAMBO');
INSERT INTO ubigeo VALUES (7847137, 'CUSCO', 'URUBAMBA', 'YUCAY');
INSERT INTO ubigeo VALUES (7938110, 'HUANCAVELICA', 'HUANCAVELICA', 'LARIA');
INSERT INTO ubigeo VALUES (7948111, 'HUANCAVELICA', 'HUANCAVELICA', 'MANTA');
INSERT INTO ubigeo VALUES (7958112, 'HUANCAVELICA', 'HUANCAVELICA', 'MARISCAL CACERES');
INSERT INTO ubigeo VALUES (7968113, 'HUANCAVELICA', 'HUANCAVELICA', 'MOYA');
INSERT INTO ubigeo VALUES (7978114, 'HUANCAVELICA', 'HUANCAVELICA', 'NUEVO OCCORO');
INSERT INTO ubigeo VALUES (7988115, 'HUANCAVELICA', 'HUANCAVELICA', 'PALCA');
INSERT INTO ubigeo VALUES (7998116, 'HUANCAVELICA', 'HUANCAVELICA', 'PILCHACA');
INSERT INTO ubigeo VALUES (8008117, 'HUANCAVELICA', 'HUANCAVELICA', 'VILCA');
INSERT INTO ubigeo VALUES (8018118, 'HUANCAVELICA', 'HUANCAVELICA', 'YAULI');
INSERT INTO ubigeo VALUES (8028119, 'HUANCAVELICA', 'HUANCAVELICA', 'ASCENSION');
INSERT INTO ubigeo VALUES (8038120, 'HUANCAVELICA', 'HUANCAVELICA', 'HUANDO');
INSERT INTO ubigeo VALUES (8218310, 'HUANCAVELICA', 'ANGARAES', 'STO TOMAS DE PATA');
INSERT INTO ubigeo VALUES (8228311, 'HUANCAVELICA', 'ANGARAES', 'SECCLLA');
INSERT INTO ubigeo VALUES (8238312, 'HUANCAVELICA', 'ANGARAES', 'CCOCHACCASA');
INSERT INTO ubigeo VALUES (8318410, 'HUANCAVELICA', 'CASTROVIRREYNA', 'HUAMATAMBO');
INSERT INTO ubigeo VALUES (8328414, 'HUANCAVELICA', 'CASTROVIRREYNA', 'MOLLEPAMPA');
INSERT INTO ubigeo VALUES (8338422, 'HUANCAVELICA', 'CASTROVIRREYNA', 'SAN JUAN');
INSERT INTO ubigeo VALUES (8348427, 'HUANCAVELICA', 'CASTROVIRREYNA', 'TANTARA');
INSERT INTO ubigeo VALUES (8358428, 'HUANCAVELICA', 'CASTROVIRREYNA', 'TICRAPO');
INSERT INTO ubigeo VALUES (8368429, 'HUANCAVELICA', 'CASTROVIRREYNA', 'SANTA ANA');
INSERT INTO ubigeo VALUES (8438511, 'HUANCAVELICA', 'TAYACAJA', 'HUACHOCOLPA');
INSERT INTO ubigeo VALUES (8448512, 'HUANCAVELICA', 'TAYACAJA', 'HUARIBAMBA');
INSERT INTO ubigeo VALUES (8458515, 'HUANCAVELICA', 'TAYACAJA', 'NAHUIMPUQUIO');
INSERT INTO ubigeo VALUES (8468517, 'HUANCAVELICA', 'TAYACAJA', 'PAZOS');
INSERT INTO ubigeo VALUES (8478518, 'HUANCAVELICA', 'TAYACAJA', 'QUISHUAR');
INSERT INTO ubigeo VALUES (8488519, 'HUANCAVELICA', 'TAYACAJA', 'SALCABAMBA');
INSERT INTO ubigeo VALUES (8498520, 'HUANCAVELICA', 'TAYACAJA', 'SAN MARCOS DE ROCCHAC');
INSERT INTO ubigeo VALUES (8508523, 'HUANCAVELICA', 'TAYACAJA', 'SURCUBAMBA');
INSERT INTO ubigeo VALUES (8518525, 'HUANCAVELICA', 'TAYACAJA', 'TINTAY PUNCU');
INSERT INTO ubigeo VALUES (8528526, 'HUANCAVELICA', 'TAYACAJA', 'SALCAHUASI');
INSERT INTO ubigeo VALUES (8628610, 'HUANCAVELICA', 'HUAYTARA', 'SAN ANTONIO DE CUSICANCHA');
INSERT INTO ubigeo VALUES (8638611, 'HUANCAVELICA', 'HUAYTARA', 'SAN FRANCISCO DE SANGAYAICO');
INSERT INTO ubigeo VALUES (8648612, 'HUANCAVELICA', 'HUAYTARA', 'SAN ISIDRO');
INSERT INTO ubigeo VALUES (8658613, 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE CHOCORVOS');
INSERT INTO ubigeo VALUES (8668614, 'HUANCAVELICA', 'HUAYTARA', 'SANTIAGO DE QUIRAHUARA');
INSERT INTO ubigeo VALUES (8678615, 'HUANCAVELICA', 'HUAYTARA', 'SANTO DOMINGO DE CAPILLAS');
INSERT INTO ubigeo VALUES (8688616, 'HUANCAVELICA', 'HUAYTARA', 'TAMBO');
INSERT INTO ubigeo VALUES (8788710, 'HUANCAVELICA', 'CHURCAMPA', 'PACHAMARCA');
INSERT INTO ubigeo VALUES (8889110, 'HUANUCO', 'HUANUCO', 'AMARILIS');
INSERT INTO ubigeo VALUES (8899111, 'HUANUCO', 'HUANUCO', 'PILLCO MARCA');
INSERT INTO ubigeo VALUES (9009312, 'HUANUCO', 'DOS DE MAYO', 'MARIAS');
INSERT INTO ubigeo VALUES (9019314, 'HUANUCO', 'DOS DE MAYO', 'PACHAS');
INSERT INTO ubigeo VALUES (9029316, 'HUANUCO', 'DOS DE MAYO', 'QUIVILLA');
INSERT INTO ubigeo VALUES (9039317, 'HUANUCO', 'DOS DE MAYO', 'RIPAN');
INSERT INTO ubigeo VALUES (9049321, 'HUANUCO', 'DOS DE MAYO', 'SHUNQUI');
INSERT INTO ubigeo VALUES (9059322, 'HUANUCO', 'DOS DE MAYO', 'SILLAPATA');
INSERT INTO ubigeo VALUES (9069323, 'HUANUCO', 'DOS DE MAYO', 'YANAS');
INSERT INTO ubigeo VALUES (9169410, 'HUANUCO', 'HUAMALIES', 'SINGA');
INSERT INTO ubigeo VALUES (9179411, 'HUANUCO', 'HUAMALIES', 'TANTAMAYO');
INSERT INTO ubigeo VALUES (9409101, 'HUANUCO', 'LAURICOCHA', 'JESUS');
INSERT INTO ubigeo VALUES (9419102, 'HUANUCO', 'LAURICOCHA', 'BANOS');
INSERT INTO ubigeo VALUES (9429103, 'HUANUCO', 'LAURICOCHA', 'SAN FRANCISCO DE ASIS');
INSERT INTO ubigeo VALUES (9439104, 'HUANUCO', 'LAURICOCHA', 'QUEROPALCA');
INSERT INTO ubigeo VALUES (9449105, 'HUANUCO', 'LAURICOCHA', 'SAN MIGUEL DE CAURI');
INSERT INTO ubigeo VALUES (9459106, 'HUANUCO', 'LAURICOCHA', 'RONDOS');
INSERT INTO ubigeo VALUES (9469107, 'HUANUCO', 'LAURICOCHA', 'JIVIA');
INSERT INTO ubigeo VALUES (9479111, 'HUANUCO', 'YAROWILCA', 'CHAVINILLO');
INSERT INTO ubigeo VALUES (9489112, 'HUANUCO', 'YAROWILCA', 'APARICIO POMARES (CHUPAN);');
INSERT INTO ubigeo VALUES (9499113, 'HUANUCO', 'YAROWILCA', 'CAHUAC');
INSERT INTO ubigeo VALUES (9509114, 'HUANUCO', 'YAROWILCA', 'CHACABAMBA');
INSERT INTO ubigeo VALUES (9519115, 'HUANUCO', 'YAROWILCA', 'JACAS CHICO');
INSERT INTO ubigeo VALUES (9529116, 'HUANUCO', 'YAROWILCA', 'OBAS');
INSERT INTO ubigeo VALUES (9539117, 'HUANUCO', 'YAROWILCA', 'PAMPAMARCA');
INSERT INTO ubigeo VALUES (9549118, 'HUANUCO', 'YAROWILCA', 'CHORAS');
INSERT INTO ubigeo VALUES (9551011, 'ICA', 'ICA', 'ICA');
INSERT INTO ubigeo VALUES (9561012, 'ICA', 'ICA', 'LA TINGUINA');
INSERT INTO ubigeo VALUES (9571013, 'ICA', 'ICA', 'LOS AQUIJES');
INSERT INTO ubigeo VALUES (9581014, 'ICA', 'ICA', 'PARCONA');
INSERT INTO ubigeo VALUES (9591015, 'ICA', 'ICA', 'PUEBLO NUEVO');
INSERT INTO ubigeo VALUES (9601016, 'ICA', 'ICA', 'SALAS');
INSERT INTO ubigeo VALUES (9611017, 'ICA', 'ICA', 'SAN JOSE DE LOS MOLINOS');
INSERT INTO ubigeo VALUES (9621018, 'ICA', 'ICA', 'SAN JUAN BAUTISTA');
INSERT INTO ubigeo VALUES (9631019, 'ICA', 'ICA', 'SANTIAGO');
INSERT INTO ubigeo VALUES (9691021, 'ICA', 'CHINCHA', 'CHINCHA ALTA');
INSERT INTO ubigeo VALUES (9701022, 'ICA', 'CHINCHA', 'CHAVIN');
INSERT INTO ubigeo VALUES (9711023, 'ICA', 'CHINCHA', 'CHINCHA BAJA');
INSERT INTO ubigeo VALUES (9721024, 'ICA', 'CHINCHA', 'EL CARMEN');
INSERT INTO ubigeo VALUES (9731025, 'ICA', 'CHINCHA', 'GROCIO PRADO');
INSERT INTO ubigeo VALUES (9741026, 'ICA', 'CHINCHA', 'SAN PEDRO DE HUACARPANA');
INSERT INTO ubigeo VALUES (9751027, 'ICA', 'CHINCHA', 'SUNAMPE');
INSERT INTO ubigeo VALUES (9761028, 'ICA', 'CHINCHA', 'TAMBO DE MORA');
INSERT INTO ubigeo VALUES (9771029, 'ICA', 'CHINCHA', 'ALTO LARAN');
INSERT INTO ubigeo VALUES (9801031, 'ICA', 'NAZCA', 'NAZCA');
INSERT INTO ubigeo VALUES (9811032, 'ICA', 'NAZCA', 'CHANGUILLO');
INSERT INTO ubigeo VALUES (9821033, 'ICA', 'NAZCA', 'EL INGENIO');
INSERT INTO ubigeo VALUES (9831034, 'ICA', 'NAZCA', 'MARCONA');
INSERT INTO ubigeo VALUES (9841035, 'ICA', 'NAZCA', 'VISTA ALEGRE');
INSERT INTO ubigeo VALUES (9851041, 'ICA', 'PISCO', 'PISCO');
INSERT INTO ubigeo VALUES (9861042, 'ICA', 'PISCO', 'HUANCANO');
INSERT INTO ubigeo VALUES (9871043, 'ICA', 'PISCO', 'HUMAY');
INSERT INTO ubigeo VALUES (9881044, 'ICA', 'PISCO', 'INDEPENDENCIA');
INSERT INTO ubigeo VALUES (9891045, 'ICA', 'PISCO', 'PARACAS');
INSERT INTO ubigeo VALUES (9901046, 'ICA', 'PISCO', 'SAN ANDRES');
INSERT INTO ubigeo VALUES (9911047, 'ICA', 'PISCO', 'SAN CLEMENTE');
INSERT INTO ubigeo VALUES (9921048, 'ICA', 'PISCO', 'TUPAC AMARU INCA');
INSERT INTO ubigeo VALUES (9931051, 'ICA', 'PALPA', 'PALPA');
INSERT INTO ubigeo VALUES (9941052, 'ICA', 'PALPA', 'LLIPATA');
INSERT INTO ubigeo VALUES (9951053, 'ICA', 'PALPA', 'RIO GRANDE');
INSERT INTO ubigeo VALUES (9961054, 'ICA', 'PALPA', 'SANTA CRUZ');
INSERT INTO ubigeo VALUES (9971055, 'ICA', 'PALPA', 'TIBILLO');
INSERT INTO ubigeo VALUES (9981111, 'JUNIN', 'HUANCAYO', 'HUANCAYO');
INSERT INTO ubigeo VALUES (9991113, 'JUNIN', 'HUANCAYO', 'CARHUACALLANGA');
INSERT INTO ubigeo VALUES (10001114, 'JUNIN', 'HUANCAYO', 'COLCA');
INSERT INTO ubigeo VALUES (10011115, 'JUNIN', 'HUANCAYO', 'CULLHUAS');
INSERT INTO ubigeo VALUES (10021116, 'JUNIN', 'HUANCAYO', 'CHACAPAMPA');
INSERT INTO ubigeo VALUES (10031117, 'JUNIN', 'HUANCAYO', 'CHICCHE');
INSERT INTO ubigeo VALUES (10041118, 'JUNIN', 'HUANCAYO', 'CHILCA');
INSERT INTO ubigeo VALUES (10051119, 'JUNIN', 'HUANCAYO', 'CHONGOS ALTO');
INSERT INTO ubigeo VALUES (10261121, 'JUNIN', 'CONCEPCION', 'CONCEPCION');
INSERT INTO ubigeo VALUES (10271122, 'JUNIN', 'CONCEPCION', 'ACO');
INSERT INTO ubigeo VALUES (10281123, 'JUNIN', 'CONCEPCION', 'ANDAMARCA');
INSERT INTO ubigeo VALUES (10291124, 'JUNIN', 'CONCEPCION', 'COMAS');
INSERT INTO ubigeo VALUES (10301125, 'JUNIN', 'CONCEPCION', 'COCHAS');
INSERT INTO ubigeo VALUES (10311126, 'JUNIN', 'CONCEPCION', 'CHAMBARA');
INSERT INTO ubigeo VALUES (10321127, 'JUNIN', 'CONCEPCION', 'HEROINAS TOLEDO');
INSERT INTO ubigeo VALUES (10331128, 'JUNIN', 'CONCEPCION', 'MANZANARES');
INSERT INTO ubigeo VALUES (10341129, 'JUNIN', 'CONCEPCION', 'MCAL CASTILLA');
INSERT INTO ubigeo VALUES (10411131, 'JUNIN', 'JAUJA', 'JAUJA');
INSERT INTO ubigeo VALUES (10421132, 'JUNIN', 'JAUJA', 'ACOLLA');
INSERT INTO ubigeo VALUES (10431133, 'JUNIN', 'JAUJA', 'APATA');
INSERT INTO ubigeo VALUES (10441134, 'JUNIN', 'JAUJA', 'ATAURA');
INSERT INTO ubigeo VALUES (10451135, 'JUNIN', 'JAUJA', 'CANCHAILLO');
INSERT INTO ubigeo VALUES (10461136, 'JUNIN', 'JAUJA', 'EL MANTARO');
INSERT INTO ubigeo VALUES (10471137, 'JUNIN', 'JAUJA', 'HUAMALI');
INSERT INTO ubigeo VALUES (10481138, 'JUNIN', 'JAUJA', 'HUARIPAMPA');
INSERT INTO ubigeo VALUES (10491139, 'JUNIN', 'JAUJA', 'HUERTAS');
INSERT INTO ubigeo VALUES (10751141, 'JUNIN', 'JUNIN', 'JUNIN');
INSERT INTO ubigeo VALUES (10761142, 'JUNIN', 'JUNIN', 'CARHUAMAYO');
INSERT INTO ubigeo VALUES (10771143, 'JUNIN', 'JUNIN', 'ONDORES');
INSERT INTO ubigeo VALUES (10781144, 'JUNIN', 'JUNIN', 'ULCUMAYO');
INSERT INTO ubigeo VALUES (10791151, 'JUNIN', 'TARMA', 'TARMA');
INSERT INTO ubigeo VALUES (10801152, 'JUNIN', 'TARMA', 'ACOBAMBA');
INSERT INTO ubigeo VALUES (10811153, 'JUNIN', 'TARMA', 'HUARICOLCA');
INSERT INTO ubigeo VALUES (10821154, 'JUNIN', 'TARMA', 'HUASAHUASI');
INSERT INTO ubigeo VALUES (10831155, 'JUNIN', 'TARMA', 'LA UNION');
INSERT INTO ubigeo VALUES (10841156, 'JUNIN', 'TARMA', 'PALCA');
INSERT INTO ubigeo VALUES (10851157, 'JUNIN', 'TARMA', 'PALCAMAYO');
INSERT INTO ubigeo VALUES (10861158, 'JUNIN', 'TARMA', 'SAN PEDRO DE CAJAS');
INSERT INTO ubigeo VALUES (10871159, 'JUNIN', 'TARMA', 'TAPO');
INSERT INTO ubigeo VALUES (10881161, 'JUNIN', 'YAULI', 'LA OROYA');
INSERT INTO ubigeo VALUES (10891162, 'JUNIN', 'YAULI', 'CHACAPALPA');
INSERT INTO ubigeo VALUES (10901163, 'JUNIN', 'YAULI', 'HUAY HUAY');
INSERT INTO ubigeo VALUES (10911164, 'JUNIN', 'YAULI', 'MARCAPOMACOCHA');
INSERT INTO ubigeo VALUES (10921165, 'JUNIN', 'YAULI', 'MOROCOCHA');
INSERT INTO ubigeo VALUES (10931166, 'JUNIN', 'YAULI', 'PACCHA');
INSERT INTO ubigeo VALUES (10941167, 'JUNIN', 'YAULI', 'STA BARBARA DE CARHUACAYAN');
INSERT INTO ubigeo VALUES (10951168, 'JUNIN', 'YAULI', 'SUITUCANCHA');
INSERT INTO ubigeo VALUES (10961169, 'JUNIN', 'YAULI', 'YAULI');
INSERT INTO ubigeo VALUES (10981171, 'JUNIN', 'SATIPO', 'SATIPO');
INSERT INTO ubigeo VALUES (10991172, 'JUNIN', 'SATIPO', 'COVIRIALI');
INSERT INTO ubigeo VALUES (11001173, 'JUNIN', 'SATIPO', 'LLAYLLA');
INSERT INTO ubigeo VALUES (11011174, 'JUNIN', 'SATIPO', 'MAZAMARI');
INSERT INTO ubigeo VALUES (11021175, 'JUNIN', 'SATIPO', 'PAMPA HERMOSA');
INSERT INTO ubigeo VALUES (11031176, 'JUNIN', 'SATIPO', 'PANGOA');
INSERT INTO ubigeo VALUES (11041177, 'JUNIN', 'SATIPO', 'RIO NEGRO');
INSERT INTO ubigeo VALUES (11051178, 'JUNIN', 'SATIPO', 'RIO TAMBO');
INSERT INTO ubigeo VALUES (11061181, 'JUNIN', 'CHANCHAMAYO', 'CHANCHAMAYO');
INSERT INTO ubigeo VALUES (11071182, 'JUNIN', 'CHANCHAMAYO', 'SAN RAMON');
INSERT INTO ubigeo VALUES (11081183, 'JUNIN', 'CHANCHAMAYO', 'VITOC');
INSERT INTO ubigeo VALUES (11091184, 'JUNIN', 'CHANCHAMAYO', 'SAN LUIS DE SHUARO');
INSERT INTO ubigeo VALUES (11101185, 'JUNIN', 'CHANCHAMAYO', 'PICHANAQUI');
INSERT INTO ubigeo VALUES (11111186, 'JUNIN', 'CHANCHAMAYO', 'PERENE');
INSERT INTO ubigeo VALUES (11121191, 'JUNIN', 'CHUPACA', 'CHUPACA');
INSERT INTO ubigeo VALUES (11131192, 'JUNIN', 'CHUPACA', 'AHUAC');
INSERT INTO ubigeo VALUES (11141193, 'JUNIN', 'CHUPACA', 'CHONGOS BAJO');
INSERT INTO ubigeo VALUES (11151194, 'JUNIN', 'CHUPACA', 'HUACHAC');
INSERT INTO ubigeo VALUES (11161195, 'JUNIN', 'CHUPACA', 'HUAMANCACA CHICO');
INSERT INTO ubigeo VALUES (11171196, 'JUNIN', 'CHUPACA', 'SAN JUAN DE ISCOS');
INSERT INTO ubigeo VALUES (11181197, 'JUNIN', 'CHUPACA', 'SAN JUAN DE JARPA');
INSERT INTO ubigeo VALUES (11191198, 'JUNIN', 'CHUPACA', 'TRES DE DICIEMBRE');
INSERT INTO ubigeo VALUES (11201199, 'JUNIN', 'CHUPACA', 'YANACANCHA');
INSERT INTO ubigeo VALUES (11211211, 'LA LIBERTAD', 'TRUJILLO', 'TRUJILLO');
INSERT INTO ubigeo VALUES (11221212, 'LA LIBERTAD', 'TRUJILLO', 'HUANCHACO');
INSERT INTO ubigeo VALUES (11231213, 'LA LIBERTAD', 'TRUJILLO', 'LAREDO');
INSERT INTO ubigeo VALUES (11241214, 'LA LIBERTAD', 'TRUJILLO', 'MOCHE');
INSERT INTO ubigeo VALUES (11251215, 'LA LIBERTAD', 'TRUJILLO', 'SALAVERRY');
INSERT INTO ubigeo VALUES (11261216, 'LA LIBERTAD', 'TRUJILLO', 'SIMBAL');
INSERT INTO ubigeo VALUES (11271217, 'LA LIBERTAD', 'TRUJILLO', 'VICTOR LARCO HERRERA');
INSERT INTO ubigeo VALUES (11281219, 'LA LIBERTAD', 'TRUJILLO', 'POROTO');
INSERT INTO ubigeo VALUES (11321221, 'LA LIBERTAD', 'BOLIVAR', 'BOLIVAR');
INSERT INTO ubigeo VALUES (11331222, 'LA LIBERTAD', 'BOLIVAR', 'BAMBAMARCA');
INSERT INTO ubigeo VALUES (11341223, 'LA LIBERTAD', 'BOLIVAR', 'CONDORMARCA');
INSERT INTO ubigeo VALUES (11351224, 'LA LIBERTAD', 'BOLIVAR', 'LONGOTEA');
INSERT INTO ubigeo VALUES (11361225, 'LA LIBERTAD', 'BOLIVAR', 'UCUNCHA');
INSERT INTO ubigeo VALUES (11371226, 'LA LIBERTAD', 'BOLIVAR', 'UCHUMARCA');
INSERT INTO ubigeo VALUES (11381231, 'LA LIBERTAD', 'SANCHEZ CARRION', 'HUAMACHUCO');
INSERT INTO ubigeo VALUES (11391232, 'LA LIBERTAD', 'SANCHEZ CARRION', 'COCHORCO');
INSERT INTO ubigeo VALUES (11401233, 'LA LIBERTAD', 'SANCHEZ CARRION', 'CURGOS');
INSERT INTO ubigeo VALUES (11411234, 'LA LIBERTAD', 'SANCHEZ CARRION', 'CHUGAY');
INSERT INTO ubigeo VALUES (11421235, 'LA LIBERTAD', 'SANCHEZ CARRION', 'MARCABAL');
INSERT INTO ubigeo VALUES (11431236, 'LA LIBERTAD', 'SANCHEZ CARRION', 'SANAGORAN');
INSERT INTO ubigeo VALUES (11441237, 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARIN');
INSERT INTO ubigeo VALUES (11451238, 'LA LIBERTAD', 'SANCHEZ CARRION', 'SARTIMBAMBA');
INSERT INTO ubigeo VALUES (11461241, 'LA LIBERTAD', 'OTUZCO', 'OTUZCO');
INSERT INTO ubigeo VALUES (11471242, 'LA LIBERTAD', 'OTUZCO', 'AGALLPAMPA');
INSERT INTO ubigeo VALUES (11481243, 'LA LIBERTAD', 'OTUZCO', 'CHARAT');
INSERT INTO ubigeo VALUES (11491244, 'LA LIBERTAD', 'OTUZCO', 'HUARANCHAL');
INSERT INTO ubigeo VALUES (11501245, 'LA LIBERTAD', 'OTUZCO', 'LA CUESTA');
INSERT INTO ubigeo VALUES (11511248, 'LA LIBERTAD', 'OTUZCO', 'PARANDAY');
INSERT INTO ubigeo VALUES (11521249, 'LA LIBERTAD', 'OTUZCO', 'SALPO');
INSERT INTO ubigeo VALUES (11561251, 'LA LIBERTAD', 'PACASMAYO', 'SAN PEDRO DE LLOC');
INSERT INTO ubigeo VALUES (11571253, 'LA LIBERTAD', 'PACASMAYO', 'GUADALUPE');
INSERT INTO ubigeo VALUES (11581254, 'LA LIBERTAD', 'PACASMAYO', 'JEQUETEPEQUE');
INSERT INTO ubigeo VALUES (11591256, 'LA LIBERTAD', 'PACASMAYO', 'PACASMAYO');
INSERT INTO ubigeo VALUES (11601258, 'LA LIBERTAD', 'PACASMAYO', 'SAN JOSE');
INSERT INTO ubigeo VALUES (11611261, 'LA LIBERTAD', 'PATAZ', 'TAYABAMBA');
INSERT INTO ubigeo VALUES (11621262, 'LA LIBERTAD', 'PATAZ', 'BULDIBUYO');
INSERT INTO ubigeo VALUES (11631263, 'LA LIBERTAD', 'PATAZ', 'CHILLIA');
INSERT INTO ubigeo VALUES (11641264, 'LA LIBERTAD', 'PATAZ', 'HUAYLILLAS');
INSERT INTO ubigeo VALUES (11651265, 'LA LIBERTAD', 'PATAZ', 'HUANCASPATA');
INSERT INTO ubigeo VALUES (11661266, 'LA LIBERTAD', 'PATAZ', 'HUAYO');
INSERT INTO ubigeo VALUES (11671267, 'LA LIBERTAD', 'PATAZ', 'ONGON');
INSERT INTO ubigeo VALUES (11681268, 'LA LIBERTAD', 'PATAZ', 'PARCOY');
INSERT INTO ubigeo VALUES (11691269, 'LA LIBERTAD', 'PATAZ', 'PATAZ');
INSERT INTO ubigeo VALUES (11741271, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTIAGO DE CHUCO');
INSERT INTO ubigeo VALUES (11751272, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'CACHICADAN');
INSERT INTO ubigeo VALUES (11761273, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEBAMBA');
INSERT INTO ubigeo VALUES (11771274, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'MOLLEPATA');
INSERT INTO ubigeo VALUES (11781275, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'QUIRUVILCA');
INSERT INTO ubigeo VALUES (11791276, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SANTA CRUZ DE CHUCA');
INSERT INTO ubigeo VALUES (11801277, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'SITABAMBA');
INSERT INTO ubigeo VALUES (11811278, 'LA LIBERTAD', 'SANTIAGO DE CHUCO', 'ANGASMARCA');
INSERT INTO ubigeo VALUES (11821281, 'LA LIBERTAD', 'ASCOPE', 'ASCOPE');
INSERT INTO ubigeo VALUES (11831282, 'LA LIBERTAD', 'ASCOPE', 'CHICAMA');
INSERT INTO ubigeo VALUES (11841283, 'LA LIBERTAD', 'ASCOPE', 'CHOCOPE');
INSERT INTO ubigeo VALUES (11851284, 'LA LIBERTAD', 'ASCOPE', 'SANTIAGO DE CAO');
INSERT INTO ubigeo VALUES (11861285, 'LA LIBERTAD', 'ASCOPE', 'MAGDALENA DE CAO');
INSERT INTO ubigeo VALUES (11871286, 'LA LIBERTAD', 'ASCOPE', 'PAIJAN');
INSERT INTO ubigeo VALUES (11881287, 'LA LIBERTAD', 'ASCOPE', 'RAZURI');
INSERT INTO ubigeo VALUES (11891288, 'LA LIBERTAD', 'ASCOPE', 'CASA GRANDE');
INSERT INTO ubigeo VALUES (11901291, 'LA LIBERTAD', 'CHEPEN', 'CHEPEN');
INSERT INTO ubigeo VALUES (11911292, 'LA LIBERTAD', 'CHEPEN', 'PACANGA');
INSERT INTO ubigeo VALUES (11921293, 'LA LIBERTAD', 'CHEPEN', 'PUEBLO NUEVO');
INSERT INTO ubigeo VALUES (12041311, 'LAMBAYEQUE', 'CHICLAYO', 'CHICLAYO');
INSERT INTO ubigeo VALUES (12051312, 'LAMBAYEQUE', 'CHICLAYO', 'CHONGOYAPE');
INSERT INTO ubigeo VALUES (12061313, 'LAMBAYEQUE', 'CHICLAYO', 'ETEN');
INSERT INTO ubigeo VALUES (12071314, 'LAMBAYEQUE', 'CHICLAYO', 'ETEN PUERTO');
INSERT INTO ubigeo VALUES (12081315, 'LAMBAYEQUE', 'CHICLAYO', 'LAGUNAS');
INSERT INTO ubigeo VALUES (12091316, 'LAMBAYEQUE', 'CHICLAYO', 'MONSEFU');
INSERT INTO ubigeo VALUES (12101317, 'LAMBAYEQUE', 'CHICLAYO', 'NUEVA ARICA');
INSERT INTO ubigeo VALUES (12111318, 'LAMBAYEQUE', 'CHICLAYO', 'OYOTUN');
INSERT INTO ubigeo VALUES (12121319, 'LAMBAYEQUE', 'CHICLAYO', 'PICSI');
INSERT INTO ubigeo VALUES (12241321, 'LAMBAYEQUE', 'FERRENAFE', 'FERRENAFE');
INSERT INTO ubigeo VALUES (12251322, 'LAMBAYEQUE', 'FERRENAFE', 'INCAHUASI');
INSERT INTO ubigeo VALUES (12261323, 'LAMBAYEQUE', 'FERRENAFE', 'CANARIS');
INSERT INTO ubigeo VALUES (12271324, 'LAMBAYEQUE', 'FERRENAFE', 'PITIPO');
INSERT INTO ubigeo VALUES (12281325, 'LAMBAYEQUE', 'FERRENAFE', 'PUEBLO NUEVO');
INSERT INTO ubigeo VALUES (12291326, 'LAMBAYEQUE', 'FERRENAFE', 'MANUEL ANTONIO MESONES MURO');
INSERT INTO ubigeo VALUES (12301331, 'LAMBAYEQUE', 'LAMBAYEQUE', 'LAMBAYEQUE');
INSERT INTO ubigeo VALUES (12311332, 'LAMBAYEQUE', 'LAMBAYEQUE', 'CHOCHOPE');
INSERT INTO ubigeo VALUES (12321333, 'LAMBAYEQUE', 'LAMBAYEQUE', 'ILLIMO');
INSERT INTO ubigeo VALUES (12331334, 'LAMBAYEQUE', 'LAMBAYEQUE', 'JAYANCA');
INSERT INTO ubigeo VALUES (12341335, 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOCHUMI');
INSERT INTO ubigeo VALUES (12351336, 'LAMBAYEQUE', 'LAMBAYEQUE', 'MORROPE');
INSERT INTO ubigeo VALUES (12361337, 'LAMBAYEQUE', 'LAMBAYEQUE', 'MOTUPE');
INSERT INTO ubigeo VALUES (12371338, 'LAMBAYEQUE', 'LAMBAYEQUE', 'OLMOS');
INSERT INTO ubigeo VALUES (12381339, 'LAMBAYEQUE', 'LAMBAYEQUE', 'PACORA');
INSERT INTO ubigeo VALUES (12421411, 'LIMA', 'LIMA', 'LIMA');
INSERT INTO ubigeo VALUES (12431412, 'LIMA', 'LIMA', 'ANCON');
INSERT INTO ubigeo VALUES (12441413, 'LIMA', 'LIMA', 'ATE');
INSERT INTO ubigeo VALUES (12451414, 'LIMA', 'LIMA', 'BRENA');
INSERT INTO ubigeo VALUES (12461415, 'LIMA', 'LIMA', 'CARABAYLLO');
INSERT INTO ubigeo VALUES (12471416, 'LIMA', 'LIMA', 'COMAS');
INSERT INTO ubigeo VALUES (12481417, 'LIMA', 'LIMA', 'CHACLACAYO');
INSERT INTO ubigeo VALUES (12491418, 'LIMA', 'LIMA', 'CHORRILLOS');
INSERT INTO ubigeo VALUES (12501419, 'LIMA', 'LIMA', 'LA VICTORIA');
INSERT INTO ubigeo VALUES (12851421, 'LIMA', 'CAJATAMBO', 'CAJATAMBO');
INSERT INTO ubigeo VALUES (12861425, 'LIMA', 'CAJATAMBO', 'COPA');
INSERT INTO ubigeo VALUES (12871426, 'LIMA', 'CAJATAMBO', 'GORGOR');
INSERT INTO ubigeo VALUES (12881427, 'LIMA', 'CAJATAMBO', 'HUANCAPON');
INSERT INTO ubigeo VALUES (12891428, 'LIMA', 'CAJATAMBO', 'MANAS');
INSERT INTO ubigeo VALUES (12901431, 'LIMA', 'CANTA', 'CANTA');
INSERT INTO ubigeo VALUES (12911432, 'LIMA', 'CANTA', 'ARAHUAY');
INSERT INTO ubigeo VALUES (12921433, 'LIMA', 'CANTA', 'HUAMANTANGA');
INSERT INTO ubigeo VALUES (12931434, 'LIMA', 'CANTA', 'HUAROS');
INSERT INTO ubigeo VALUES (12941435, 'LIMA', 'CANTA', 'LACHAQUI');
INSERT INTO ubigeo VALUES (12951436, 'LIMA', 'CANTA', 'SAN BUENAVENTURA');
INSERT INTO ubigeo VALUES (12961437, 'LIMA', 'CANTA', 'SANTA ROSA DE QUIVES');
INSERT INTO ubigeo VALUES (12971441, 'LIMA', 'CANETE', 'SAN VICENTE DE CANETE');
INSERT INTO ubigeo VALUES (12981442, 'LIMA', 'CANETE', 'CALANGO');
INSERT INTO ubigeo VALUES (12991443, 'LIMA', 'CANETE', 'CERRO AZUL');
INSERT INTO ubigeo VALUES (13001444, 'LIMA', 'CANETE', 'COAYLLO');
INSERT INTO ubigeo VALUES (13011445, 'LIMA', 'CANETE', 'CHILCA');
INSERT INTO ubigeo VALUES (13021446, 'LIMA', 'CANETE', 'IMPERIAL');
INSERT INTO ubigeo VALUES (13031447, 'LIMA', 'CANETE', 'LUNAHUANA');
INSERT INTO ubigeo VALUES (13041448, 'LIMA', 'CANETE', 'MALA');
INSERT INTO ubigeo VALUES (13051449, 'LIMA', 'CANETE', 'NUEVO IMPERIAL');
INSERT INTO ubigeo VALUES (13131451, 'LIMA', 'HUAURA', 'HUACHO');
INSERT INTO ubigeo VALUES (13141452, 'LIMA', 'HUAURA', 'AMBAR');
INSERT INTO ubigeo VALUES (13151454, 'LIMA', 'HUAURA', 'CALETA DE CARQUIN');
INSERT INTO ubigeo VALUES (13161455, 'LIMA', 'HUAURA', 'CHECRAS');
INSERT INTO ubigeo VALUES (13171456, 'LIMA', 'HUAURA', 'HUALMAY');
INSERT INTO ubigeo VALUES (13181457, 'LIMA', 'HUAURA', 'HUAURA');
INSERT INTO ubigeo VALUES (13191458, 'LIMA', 'HUAURA', 'LEONCIO PRADO');
INSERT INTO ubigeo VALUES (13201459, 'LIMA', 'HUAURA', 'PACCHO');
INSERT INTO ubigeo VALUES (13251461, 'LIMA', 'HUAROCHIRI', 'MATUCANA');
INSERT INTO ubigeo VALUES (13261462, 'LIMA', 'HUAROCHIRI', 'ANTIOQUIA');
INSERT INTO ubigeo VALUES (13271463, 'LIMA', 'HUAROCHIRI', 'CALLAHUANCA');
INSERT INTO ubigeo VALUES (13281464, 'LIMA', 'HUAROCHIRI', 'CARAMPOMA');
INSERT INTO ubigeo VALUES (13291465, 'LIMA', 'HUAROCHIRI', 'CASTA');
INSERT INTO ubigeo VALUES (13301466, 'LIMA', 'HUAROCHIRI', 'SAN JOSE DE LOS CHORRILLOS');
INSERT INTO ubigeo VALUES (13311467, 'LIMA', 'HUAROCHIRI', 'CHICLA');
INSERT INTO ubigeo VALUES (13321468, 'LIMA', 'HUAROCHIRI', 'HUANZA');
INSERT INTO ubigeo VALUES (13331469, 'LIMA', 'HUAROCHIRI', 'HUAROCHIRI');
INSERT INTO ubigeo VALUES (13571471, 'LIMA', 'YAUYOS', 'YAUYOS');
INSERT INTO ubigeo VALUES (13581472, 'LIMA', 'YAUYOS', 'ALIS');
INSERT INTO ubigeo VALUES (13591473, 'LIMA', 'YAUYOS', 'AYAUCA');
INSERT INTO ubigeo VALUES (13601474, 'LIMA', 'YAUYOS', 'AYAVIRI');
INSERT INTO ubigeo VALUES (13611475, 'LIMA', 'YAUYOS', 'AZANGARO');
INSERT INTO ubigeo VALUES (13621476, 'LIMA', 'YAUYOS', 'CACRA');
INSERT INTO ubigeo VALUES (13631477, 'LIMA', 'YAUYOS', 'CARANIA');
INSERT INTO ubigeo VALUES (13641478, 'LIMA', 'YAUYOS', 'COCHAS');
INSERT INTO ubigeo VALUES (13651479, 'LIMA', 'YAUYOS', 'COLONIA');
INSERT INTO ubigeo VALUES (13901481, 'LIMA', 'HUARAL', 'HUARAL');
INSERT INTO ubigeo VALUES (13911482, 'LIMA', 'HUARAL', 'ATAVILLOS ALTO');
INSERT INTO ubigeo VALUES (13921483, 'LIMA', 'HUARAL', 'ATAVILLOS BAJO');
INSERT INTO ubigeo VALUES (13931484, 'LIMA', 'HUARAL', 'AUCALLAMA');
INSERT INTO ubigeo VALUES (13941485, 'LIMA', 'HUARAL', 'CHANCAY');
INSERT INTO ubigeo VALUES (13951486, 'LIMA', 'HUARAL', 'IHUARI');
INSERT INTO ubigeo VALUES (13961487, 'LIMA', 'HUARAL', 'LAMPIAN');
INSERT INTO ubigeo VALUES (13971488, 'LIMA', 'HUARAL', 'PACARAOS');
INSERT INTO ubigeo VALUES (13981489, 'LIMA', 'HUARAL', 'SAN MIGUEL DE ACOS');
INSERT INTO ubigeo VALUES (14021491, 'LIMA', 'BARRANCA', 'BARRANCA');
INSERT INTO ubigeo VALUES (14031492, 'LIMA', 'BARRANCA', 'PARAMONGA');
INSERT INTO ubigeo VALUES (14041493, 'LIMA', 'BARRANCA', 'PATIVILCA');
INSERT INTO ubigeo VALUES (14051494, 'LIMA', 'BARRANCA', 'SUPE');
INSERT INTO ubigeo VALUES (14061495, 'LIMA', 'BARRANCA', 'SUPE PUERTO');
INSERT INTO ubigeo VALUES (14131511, 'LORETO', 'MAYNAS', 'IQUITOS');
INSERT INTO ubigeo VALUES (14141512, 'LORETO', 'MAYNAS', 'ALTO NANAY');
INSERT INTO ubigeo VALUES (14151513, 'LORETO', 'MAYNAS', 'FERNANDO LORES');
INSERT INTO ubigeo VALUES (14161514, 'LORETO', 'MAYNAS', 'LAS AMAZONAS');
INSERT INTO ubigeo VALUES (14171515, 'LORETO', 'MAYNAS', 'MAZAN');
INSERT INTO ubigeo VALUES (14181516, 'LORETO', 'MAYNAS', 'NAPO');
INSERT INTO ubigeo VALUES (14191517, 'LORETO', 'MAYNAS', 'PUTUMAYO');
INSERT INTO ubigeo VALUES (14201518, 'LORETO', 'MAYNAS', 'TORRES CAUSANA');
INSERT INTO ubigeo VALUES (14261521, 'LORETO', 'ALTO AMAZONAS', 'YURIMAGUAS');
INSERT INTO ubigeo VALUES (14271522, 'LORETO', 'ALTO AMAZONAS', 'BALSAPUERTO');
INSERT INTO ubigeo VALUES (14281525, 'LORETO', 'ALTO AMAZONAS', 'JEBEROS');
INSERT INTO ubigeo VALUES (14291526, 'LORETO', 'ALTO AMAZONAS', 'LAGUNAS');
INSERT INTO ubigeo VALUES (14321531, 'LORETO', 'LORETO', 'NAUTA');
INSERT INTO ubigeo VALUES (14331532, 'LORETO', 'LORETO', 'PARINARI');
INSERT INTO ubigeo VALUES (14341533, 'LORETO', 'LORETO', 'TIGRE');
INSERT INTO ubigeo VALUES (14351534, 'LORETO', 'LORETO', 'URARINAS');
INSERT INTO ubigeo VALUES (14361535, 'LORETO', 'LORETO', 'TROMPETEROS');
INSERT INTO ubigeo VALUES (14371541, 'LORETO', 'REQUENA', 'REQUENA');
INSERT INTO ubigeo VALUES (14381542, 'LORETO', 'REQUENA', 'ALTO TAPICHE');
INSERT INTO ubigeo VALUES (14391543, 'LORETO', 'REQUENA', 'CAPELO');
INSERT INTO ubigeo VALUES (14401544, 'LORETO', 'REQUENA', 'EMILIO SAN MARTIN');
INSERT INTO ubigeo VALUES (14411545, 'LORETO', 'REQUENA', 'MAQUIA');
INSERT INTO ubigeo VALUES (14421546, 'LORETO', 'REQUENA', 'PUINAHUA');
INSERT INTO ubigeo VALUES (14431547, 'LORETO', 'REQUENA', 'SAPUENA');
INSERT INTO ubigeo VALUES (14441548, 'LORETO', 'REQUENA', 'SOPLIN');
INSERT INTO ubigeo VALUES (14451549, 'LORETO', 'REQUENA', 'TAPICHE');
INSERT INTO ubigeo VALUES (14481551, 'LORETO', 'UCAYALI', 'CONTAMANA');
INSERT INTO ubigeo VALUES (14491552, 'LORETO', 'UCAYALI', 'VARGAS GUERRA');
INSERT INTO ubigeo VALUES (14501553, 'LORETO', 'UCAYALI', 'PADRE MARQUEZ');
INSERT INTO ubigeo VALUES (14511554, 'LORETO', 'UCAYALI', 'PAMPA HERMOZA');
INSERT INTO ubigeo VALUES (14521555, 'LORETO', 'UCAYALI', 'SARAYACU');
INSERT INTO ubigeo VALUES (14531556, 'LORETO', 'UCAYALI', 'INAHUAYA');
INSERT INTO ubigeo VALUES (14541561, 'LORETO', 'MARISCAL RAMON CASTILLA', 'MARISCAL RAMON CASTILLA');
INSERT INTO ubigeo VALUES (14551562, 'LORETO', 'MARISCAL RAMON CASTILLA', 'PEBAS');
INSERT INTO ubigeo VALUES (14561563, 'LORETO', 'MARISCAL RAMON CASTILLA', 'YAVARI');
INSERT INTO ubigeo VALUES (14571564, 'LORETO', 'MARISCAL RAMON CASTILLA', 'SAN PABLO');
INSERT INTO ubigeo VALUES (14581571, 'LORETO', 'DATEM DEL MARANON', 'BARRANCA');
INSERT INTO ubigeo VALUES (14591572, 'LORETO', 'DATEM DEL MARANON', 'ANDOAS');
INSERT INTO ubigeo VALUES (14601573, 'LORETO', 'DATEM DEL MARANON', 'CAHUAPANAS');
INSERT INTO ubigeo VALUES (14611574, 'LORETO', 'DATEM DEL MARANON', 'MANSERICHE');
INSERT INTO ubigeo VALUES (14621575, 'LORETO', 'DATEM DEL MARANON', 'MORONA');
INSERT INTO ubigeo VALUES (14631576, 'LORETO', 'DATEM DEL MARANON', 'PASTAZA');
INSERT INTO ubigeo VALUES (14641611, 'MADRE DE DIOS', 'TAMBOPATA', 'TAMBOPATA');
INSERT INTO ubigeo VALUES (14651612, 'MADRE DE DIOS', 'TAMBOPATA', 'INAMBARI');
INSERT INTO ubigeo VALUES (14661613, 'MADRE DE DIOS', 'TAMBOPATA', 'LAS PIEDRAS');
INSERT INTO ubigeo VALUES (14671614, 'MADRE DE DIOS', 'TAMBOPATA', 'LABERINTO');
INSERT INTO ubigeo VALUES (14681621, 'MADRE DE DIOS', 'MANU', 'MANU');
INSERT INTO ubigeo VALUES (14691622, 'MADRE DE DIOS', 'MANU', 'FITZCARRALD');
INSERT INTO ubigeo VALUES (14701623, 'MADRE DE DIOS', 'MANU', 'MADRE DE DIOS');
INSERT INTO ubigeo VALUES (14711624, 'MADRE DE DIOS', 'MANU', 'HUEPETUHE');
INSERT INTO ubigeo VALUES (14721631, 'MADRE DE DIOS', 'TAHUAMANU', 'INAPARI');
INSERT INTO ubigeo VALUES (14731632, 'MADRE DE DIOS', 'TAHUAMANU', 'IBERIA');
INSERT INTO ubigeo VALUES (14741633, 'MADRE DE DIOS', 'TAHUAMANU', 'TAHUAMANU');
INSERT INTO ubigeo VALUES (14751711, 'MOQUEGUA', 'MARISCAL NIETO', 'MOQUEGUA');
INSERT INTO ubigeo VALUES (14761712, 'MOQUEGUA', 'MARISCAL NIETO', 'CARUMAS');
INSERT INTO ubigeo VALUES (14771713, 'MOQUEGUA', 'MARISCAL NIETO', 'CUCHUMBAYA');
INSERT INTO ubigeo VALUES (14781714, 'MOQUEGUA', 'MARISCAL NIETO', 'SAN CRISTOBAL');
INSERT INTO ubigeo VALUES (14791715, 'MOQUEGUA', 'MARISCAL NIETO', 'TORATA');
INSERT INTO ubigeo VALUES (14801716, 'MOQUEGUA', 'MARISCAL NIETO', 'SAMEGUA');
INSERT INTO ubigeo VALUES (14811721, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'OMATE');
INSERT INTO ubigeo VALUES (14821722, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'COALAQUE');
INSERT INTO ubigeo VALUES (14831723, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'CHOJATA');
INSERT INTO ubigeo VALUES (14841724, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'ICHUNA');
INSERT INTO ubigeo VALUES (14851725, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LA CAPILLA');
INSERT INTO ubigeo VALUES (14861726, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'LLOQUE');
INSERT INTO ubigeo VALUES (14871727, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'MATALAQUE');
INSERT INTO ubigeo VALUES (14881728, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'PUQUINA');
INSERT INTO ubigeo VALUES (14891729, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'QUINISTAQUILLAS');
INSERT INTO ubigeo VALUES (14921731, 'MOQUEGUA', 'ILO', 'ILO');
INSERT INTO ubigeo VALUES (14931732, 'MOQUEGUA', 'ILO', 'EL ALGARROBAL');
INSERT INTO ubigeo VALUES (14941733, 'MOQUEGUA', 'ILO', 'PACOCHA');
INSERT INTO ubigeo VALUES (14951811, 'PASCO', 'PASCO', 'CHAUPIMARCA');
INSERT INTO ubigeo VALUES (14961813, 'PASCO', 'PASCO', 'HUACHON');
INSERT INTO ubigeo VALUES (14971814, 'PASCO', 'PASCO', 'HUARIACA');
INSERT INTO ubigeo VALUES (14981815, 'PASCO', 'PASCO', 'HUAYLLAY');
INSERT INTO ubigeo VALUES (14991816, 'PASCO', 'PASCO', 'NINACACA');
INSERT INTO ubigeo VALUES (15001817, 'PASCO', 'PASCO', 'PALLANCHACRA');
INSERT INTO ubigeo VALUES (15011818, 'PASCO', 'PASCO', 'PAUCARTAMBO');
INSERT INTO ubigeo VALUES (15021819, 'PASCO', 'PASCO', 'SAN FCO DE ASIS DE YARUSYACAN');
INSERT INTO ubigeo VALUES (15081821, 'PASCO', 'DANIEL ALCIDES CARRION', 'YANAHUANCA');
INSERT INTO ubigeo VALUES (15091822, 'PASCO', 'DANIEL ALCIDES CARRION', 'CHACAYAN');
INSERT INTO ubigeo VALUES (15101823, 'PASCO', 'DANIEL ALCIDES CARRION', 'GOYLLARISQUIZGA');
INSERT INTO ubigeo VALUES (15111824, 'PASCO', 'DANIEL ALCIDES CARRION', 'PAUCAR');
INSERT INTO ubigeo VALUES (15121825, 'PASCO', 'DANIEL ALCIDES CARRION', 'SAN PEDRO DE PILLAO');
INSERT INTO ubigeo VALUES (15131826, 'PASCO', 'DANIEL ALCIDES CARRION', 'SANTA ANA DE TUSI');
INSERT INTO ubigeo VALUES (15141827, 'PASCO', 'DANIEL ALCIDES CARRION', 'TAPUC');
INSERT INTO ubigeo VALUES (15151828, 'PASCO', 'DANIEL ALCIDES CARRION', 'VILCABAMBA');
INSERT INTO ubigeo VALUES (15161831, 'PASCO', 'OXAPAMPA', 'OXAPAMPA');
INSERT INTO ubigeo VALUES (15171832, 'PASCO', 'OXAPAMPA', 'CHONTABAMBA');
INSERT INTO ubigeo VALUES (15181833, 'PASCO', 'OXAPAMPA', 'HUANCABAMBA');
INSERT INTO ubigeo VALUES (15191834, 'PASCO', 'OXAPAMPA', 'PUERTO BERMUDEZ');
INSERT INTO ubigeo VALUES (15201835, 'PASCO', 'OXAPAMPA', 'VILLA RICA');
INSERT INTO ubigeo VALUES (15211836, 'PASCO', 'OXAPAMPA', 'POZUZO');
INSERT INTO ubigeo VALUES (15221837, 'PASCO', 'OXAPAMPA', 'PALCAZU');
INSERT INTO ubigeo VALUES (15231911, 'PIURA', 'PIURA', 'PIURA');
INSERT INTO ubigeo VALUES (15241913, 'PIURA', 'PIURA', 'CASTILLA');
INSERT INTO ubigeo VALUES (15251914, 'PIURA', 'PIURA', 'CATACAOS');
INSERT INTO ubigeo VALUES (15261915, 'PIURA', 'PIURA', 'LA ARENA');
INSERT INTO ubigeo VALUES (15271916, 'PIURA', 'PIURA', 'LA UNION');
INSERT INTO ubigeo VALUES (15281917, 'PIURA', 'PIURA', 'LAS LOMAS');
INSERT INTO ubigeo VALUES (15291919, 'PIURA', 'PIURA', 'TAMBO GRANDE');
INSERT INTO ubigeo VALUES (15321921, 'PIURA', 'AYABACA', 'AYABACA');
INSERT INTO ubigeo VALUES (15331922, 'PIURA', 'AYABACA', 'FRIAS');
INSERT INTO ubigeo VALUES (15341923, 'PIURA', 'AYABACA', 'LAGUNAS');
INSERT INTO ubigeo VALUES (15351924, 'PIURA', 'AYABACA', 'MONTERO');
INSERT INTO ubigeo VALUES (15361925, 'PIURA', 'AYABACA', 'PACAIPAMPA');
INSERT INTO ubigeo VALUES (15371926, 'PIURA', 'AYABACA', 'SAPILLICA');
INSERT INTO ubigeo VALUES (15381927, 'PIURA', 'AYABACA', 'SICCHEZ');
INSERT INTO ubigeo VALUES (15391928, 'PIURA', 'AYABACA', 'SUYO');
INSERT INTO ubigeo VALUES (15401929, 'PIURA', 'AYABACA', 'JILILI');
INSERT INTO ubigeo VALUES (15421931, 'PIURA', 'HUANCABAMBA', 'HUANCABAMBA');
INSERT INTO ubigeo VALUES (15431932, 'PIURA', 'HUANCABAMBA', 'CANCHAQUE');
INSERT INTO ubigeo VALUES (15441933, 'PIURA', 'HUANCABAMBA', 'HUARMACA');
INSERT INTO ubigeo VALUES (15451934, 'PIURA', 'HUANCABAMBA', 'SONDOR');
INSERT INTO ubigeo VALUES (15461935, 'PIURA', 'HUANCABAMBA', 'SONDORILLO');
INSERT INTO ubigeo VALUES (15471936, 'PIURA', 'HUANCABAMBA', 'EL CARMEN DE LA FRONTERA');
INSERT INTO ubigeo VALUES (15481937, 'PIURA', 'HUANCABAMBA', 'SAN MIGUEL DE EL FAIQUE');
INSERT INTO ubigeo VALUES (15491938, 'PIURA', 'HUANCABAMBA', 'LALAQUIZ');
INSERT INTO ubigeo VALUES (15501941, 'PIURA', 'MORROPON', 'CHULUCANAS');
INSERT INTO ubigeo VALUES (15511942, 'PIURA', 'MORROPON', 'BUENOS AIRES');
INSERT INTO ubigeo VALUES (15521943, 'PIURA', 'MORROPON', 'CHALACO');
INSERT INTO ubigeo VALUES (15531944, 'PIURA', 'MORROPON', 'MORROPON');
INSERT INTO ubigeo VALUES (15541945, 'PIURA', 'MORROPON', 'SALITRAL');
INSERT INTO ubigeo VALUES (15551946, 'PIURA', 'MORROPON', 'SANTA CATALINA DE MOSSA');
INSERT INTO ubigeo VALUES (15561947, 'PIURA', 'MORROPON', 'SANTO DOMINGO');
INSERT INTO ubigeo VALUES (15571948, 'PIURA', 'MORROPON', 'LA MATANZA');
INSERT INTO ubigeo VALUES (15581949, 'PIURA', 'MORROPON', 'YAMANGO');
INSERT INTO ubigeo VALUES (15601951, 'PIURA', 'PAITA', 'PAITA');
INSERT INTO ubigeo VALUES (15611952, 'PIURA', 'PAITA', 'AMOTAPE');
INSERT INTO ubigeo VALUES (15621953, 'PIURA', 'PAITA', 'ARENAL');
INSERT INTO ubigeo VALUES (15631954, 'PIURA', 'PAITA', 'LA HUACA');
INSERT INTO ubigeo VALUES (15641955, 'PIURA', 'PAITA', 'PUEBLO NUEVO DE COLAN');
INSERT INTO ubigeo VALUES (15651956, 'PIURA', 'PAITA', 'TAMARINDO');
INSERT INTO ubigeo VALUES (15661957, 'PIURA', 'PAITA', 'VICHAYAL');
INSERT INTO ubigeo VALUES (15671961, 'PIURA', 'SULLANA', 'SULLANA');
INSERT INTO ubigeo VALUES (15681962, 'PIURA', 'SULLANA', 'BELLAVISTA');
INSERT INTO ubigeo VALUES (15691963, 'PIURA', 'SULLANA', 'LANCONES');
INSERT INTO ubigeo VALUES (15701964, 'PIURA', 'SULLANA', 'MARCAVELICA');
INSERT INTO ubigeo VALUES (15711965, 'PIURA', 'SULLANA', 'MIGUEL CHECA');
INSERT INTO ubigeo VALUES (15721966, 'PIURA', 'SULLANA', 'QUERECOTILLO');
INSERT INTO ubigeo VALUES (15731967, 'PIURA', 'SULLANA', 'SALITRAL');
INSERT INTO ubigeo VALUES (15741968, 'PIURA', 'SULLANA', 'IGNACIO ESCUDERO');
INSERT INTO ubigeo VALUES (15751971, 'PIURA', 'TALARA', 'PARINAS');
INSERT INTO ubigeo VALUES (15761972, 'PIURA', 'TALARA', 'EL ALTO');
INSERT INTO ubigeo VALUES (15771973, 'PIURA', 'TALARA', 'LA BREA');
INSERT INTO ubigeo VALUES (15781974, 'PIURA', 'TALARA', 'LOBITOS');
INSERT INTO ubigeo VALUES (15791975, 'PIURA', 'TALARA', 'MANCORA');
INSERT INTO ubigeo VALUES (15801976, 'PIURA', 'TALARA', 'LOS ORGANOS');
INSERT INTO ubigeo VALUES (15811981, 'PIURA', 'SECHURA', 'SECHURA');
INSERT INTO ubigeo VALUES (15821982, 'PIURA', 'SECHURA', 'VICE');
INSERT INTO ubigeo VALUES (15831983, 'PIURA', 'SECHURA', 'BERNAL');
INSERT INTO ubigeo VALUES (15841984, 'PIURA', 'SECHURA', 'BELLAVISTA DE LA UNION');
INSERT INTO ubigeo VALUES (15851985, 'PIURA', 'SECHURA', 'CRISTO NOS VALGA');
INSERT INTO ubigeo VALUES (15861986, 'PIURA', 'SECHURA', 'RINCONADA LLICUAR');
INSERT INTO ubigeo VALUES (15872011, 'PUNO', 'PUNO', 'PUNO');
INSERT INTO ubigeo VALUES (15882012, 'PUNO', 'PUNO', 'ACORA');
INSERT INTO ubigeo VALUES (15892013, 'PUNO', 'PUNO', 'ATUNCOLLA');
INSERT INTO ubigeo VALUES (15902014, 'PUNO', 'PUNO', 'CAPACHICA');
INSERT INTO ubigeo VALUES (15912015, 'PUNO', 'PUNO', 'COATA');
INSERT INTO ubigeo VALUES (15922016, 'PUNO', 'PUNO', 'CHUCUITO');
INSERT INTO ubigeo VALUES (15932017, 'PUNO', 'PUNO', 'HUATA');
INSERT INTO ubigeo VALUES (15942018, 'PUNO', 'PUNO', 'MANAZO');
INSERT INTO ubigeo VALUES (15952019, 'PUNO', 'PUNO', 'PAUCARCOLLA');
INSERT INTO ubigeo VALUES (16022021, 'PUNO', 'AZANGARO', 'AZANGARO');
INSERT INTO ubigeo VALUES (16032022, 'PUNO', 'AZANGARO', 'ACHAYA');
INSERT INTO ubigeo VALUES (16042023, 'PUNO', 'AZANGARO', 'ARAPA');
INSERT INTO ubigeo VALUES (16052024, 'PUNO', 'AZANGARO', 'ASILLO');
INSERT INTO ubigeo VALUES (16062025, 'PUNO', 'AZANGARO', 'CAMINACA');
INSERT INTO ubigeo VALUES (16072026, 'PUNO', 'AZANGARO', 'CHUPA');
INSERT INTO ubigeo VALUES (16082027, 'PUNO', 'AZANGARO', 'JOSE DOMINGO CHOQUEHUANCA');
INSERT INTO ubigeo VALUES (16092028, 'PUNO', 'AZANGARO', 'MUNANI');
INSERT INTO ubigeo VALUES (16172031, 'PUNO', 'CARABAYA', 'MACUSANI');
INSERT INTO ubigeo VALUES (16182032, 'PUNO', 'CARABAYA', 'AJOYANI');
INSERT INTO ubigeo VALUES (16192033, 'PUNO', 'CARABAYA', 'AYAPATA');
INSERT INTO ubigeo VALUES (16202034, 'PUNO', 'CARABAYA', 'COASA');
INSERT INTO ubigeo VALUES (16212035, 'PUNO', 'CARABAYA', 'CORANI');
INSERT INTO ubigeo VALUES (16222036, 'PUNO', 'CARABAYA', 'CRUCERO');
INSERT INTO ubigeo VALUES (16232037, 'PUNO', 'CARABAYA', 'ITUATA');
INSERT INTO ubigeo VALUES (16242038, 'PUNO', 'CARABAYA', 'OLLACHEA');
INSERT INTO ubigeo VALUES (16252039, 'PUNO', 'CARABAYA', 'SAN GABAN');
INSERT INTO ubigeo VALUES (16272041, 'PUNO', 'CHUCUITO', 'JULI');
INSERT INTO ubigeo VALUES (16282042, 'PUNO', 'CHUCUITO', 'DESAGUADERO');
INSERT INTO ubigeo VALUES (16292043, 'PUNO', 'CHUCUITO', 'HUACULLANI');
INSERT INTO ubigeo VALUES (16302046, 'PUNO', 'CHUCUITO', 'PISACOMA');
INSERT INTO ubigeo VALUES (16312047, 'PUNO', 'CHUCUITO', 'POMATA');
INSERT INTO ubigeo VALUES (16342051, 'PUNO', 'HUANCANE', 'HUANCANE');
INSERT INTO ubigeo VALUES (16352052, 'PUNO', 'HUANCANE', 'COJATA');
INSERT INTO ubigeo VALUES (16362054, 'PUNO', 'HUANCANE', 'INCHUPALLA');
INSERT INTO ubigeo VALUES (16372056, 'PUNO', 'HUANCANE', 'PUSI');
INSERT INTO ubigeo VALUES (16382057, 'PUNO', 'HUANCANE', 'ROSASPATA');
INSERT INTO ubigeo VALUES (16392058, 'PUNO', 'HUANCANE', 'TARACO');
INSERT INTO ubigeo VALUES (16402059, 'PUNO', 'HUANCANE', 'VILQUE CHICO');
INSERT INTO ubigeo VALUES (16422061, 'PUNO', 'LAMPA', 'LAMPA');
INSERT INTO ubigeo VALUES (16432062, 'PUNO', 'LAMPA', 'CABANILLA');
INSERT INTO ubigeo VALUES (16442063, 'PUNO', 'LAMPA', 'CALAPUJA');
INSERT INTO ubigeo VALUES (16452064, 'PUNO', 'LAMPA', 'NICASIO');
INSERT INTO ubigeo VALUES (16462065, 'PUNO', 'LAMPA', 'OCUVIRI');
INSERT INTO ubigeo VALUES (16472066, 'PUNO', 'LAMPA', 'PALCA');
INSERT INTO ubigeo VALUES (16482067, 'PUNO', 'LAMPA', 'PARATIA');
INSERT INTO ubigeo VALUES (16492068, 'PUNO', 'LAMPA', 'PUCARA');
INSERT INTO ubigeo VALUES (16502069, 'PUNO', 'LAMPA', 'SANTA LUCIA');
INSERT INTO ubigeo VALUES (16522071, 'PUNO', 'MELGAR', 'AYAVIRI');
INSERT INTO ubigeo VALUES (16532072, 'PUNO', 'MELGAR', 'ANTAUTA');
INSERT INTO ubigeo VALUES (16542073, 'PUNO', 'MELGAR', 'CUPI');
INSERT INTO ubigeo VALUES (16552074, 'PUNO', 'MELGAR', 'LLALLI');
INSERT INTO ubigeo VALUES (16562075, 'PUNO', 'MELGAR', 'MACARI');
INSERT INTO ubigeo VALUES (16572076, 'PUNO', 'MELGAR', 'NUNOA');
INSERT INTO ubigeo VALUES (16582077, 'PUNO', 'MELGAR', 'ORURILLO');
INSERT INTO ubigeo VALUES (16592078, 'PUNO', 'MELGAR', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (16602079, 'PUNO', 'MELGAR', 'UMACHIRI');
INSERT INTO ubigeo VALUES (16612081, 'PUNO', 'SANDIA', 'SANDIA');
INSERT INTO ubigeo VALUES (16622083, 'PUNO', 'SANDIA', 'CUYOCUYO');
INSERT INTO ubigeo VALUES (16632084, 'PUNO', 'SANDIA', 'LIMBANI');
INSERT INTO ubigeo VALUES (16642085, 'PUNO', 'SANDIA', 'PHARA');
INSERT INTO ubigeo VALUES (16652086, 'PUNO', 'SANDIA', 'PATAMBUCO');
INSERT INTO ubigeo VALUES (16662087, 'PUNO', 'SANDIA', 'QUIACA');
INSERT INTO ubigeo VALUES (16672088, 'PUNO', 'SANDIA', 'SAN JUAN DEL ORO');
INSERT INTO ubigeo VALUES (16712091, 'PUNO', 'SAN ROMAN', 'JULIACA');
INSERT INTO ubigeo VALUES (16722092, 'PUNO', 'SAN ROMAN', 'CABANA');
INSERT INTO ubigeo VALUES (16732093, 'PUNO', 'SAN ROMAN', 'CABANILLAS');
INSERT INTO ubigeo VALUES (16742094, 'PUNO', 'SAN ROMAN', 'CARACOTO');
INSERT INTO ubigeo VALUES (16962111, 'SAN MARTIN', 'MOYOBAMBA', 'MOYOBAMBA');
INSERT INTO ubigeo VALUES (16972112, 'SAN MARTIN', 'MOYOBAMBA', 'CALZADA');
INSERT INTO ubigeo VALUES (16982113, 'SAN MARTIN', 'MOYOBAMBA', 'HABANA');
INSERT INTO ubigeo VALUES (16992114, 'SAN MARTIN', 'MOYOBAMBA', 'JEPELACIO');
INSERT INTO ubigeo VALUES (17002115, 'SAN MARTIN', 'MOYOBAMBA', 'SORITOR');
INSERT INTO ubigeo VALUES (17012116, 'SAN MARTIN', 'MOYOBAMBA', 'YANTALO');
INSERT INTO ubigeo VALUES (17022121, 'SAN MARTIN', 'HUALLAGA', 'SAPOSOA');
INSERT INTO ubigeo VALUES (17032122, 'SAN MARTIN', 'HUALLAGA', 'PISCOYACU');
INSERT INTO ubigeo VALUES (17042123, 'SAN MARTIN', 'HUALLAGA', 'SACANCHE');
INSERT INTO ubigeo VALUES (17052124, 'SAN MARTIN', 'HUALLAGA', 'TINGO DE SAPOSOA');
INSERT INTO ubigeo VALUES (17062125, 'SAN MARTIN', 'HUALLAGA', 'ALTO SAPOSOA');
INSERT INTO ubigeo VALUES (17072126, 'SAN MARTIN', 'HUALLAGA', 'EL ESLABON');
INSERT INTO ubigeo VALUES (17082131, 'SAN MARTIN', 'LAMAS', 'LAMAS');
INSERT INTO ubigeo VALUES (17092133, 'SAN MARTIN', 'LAMAS', 'BARRANQUITA');
INSERT INTO ubigeo VALUES (17102134, 'SAN MARTIN', 'LAMAS', 'CAYNARACHI');
INSERT INTO ubigeo VALUES (17112135, 'SAN MARTIN', 'LAMAS', 'CUNUMBUQUI');
INSERT INTO ubigeo VALUES (17122136, 'SAN MARTIN', 'LAMAS', 'PINTO RECODO');
INSERT INTO ubigeo VALUES (17132137, 'SAN MARTIN', 'LAMAS', 'RUMISAPA');
INSERT INTO ubigeo VALUES (17192141, 'SAN MARTIN', 'MARISCAL CACERES', 'JUANJUI');
INSERT INTO ubigeo VALUES (17202142, 'SAN MARTIN', 'MARISCAL CACERES', 'CAMPANILLA');
INSERT INTO ubigeo VALUES (17212143, 'SAN MARTIN', 'MARISCAL CACERES', 'HUICUNGO');
INSERT INTO ubigeo VALUES (17222144, 'SAN MARTIN', 'MARISCAL CACERES', 'PACHIZA');
INSERT INTO ubigeo VALUES (17232145, 'SAN MARTIN', 'MARISCAL CACERES', 'PAJARILLO');
INSERT INTO ubigeo VALUES (17242151, 'SAN MARTIN', 'RIOJA', 'RIOJA');
INSERT INTO ubigeo VALUES (17252152, 'SAN MARTIN', 'RIOJA', 'POSIC');
INSERT INTO ubigeo VALUES (17262153, 'SAN MARTIN', 'RIOJA', 'YORONGOS');
INSERT INTO ubigeo VALUES (17272154, 'SAN MARTIN', 'RIOJA', 'YURACYACU');
INSERT INTO ubigeo VALUES (17282155, 'SAN MARTIN', 'RIOJA', 'NUEVA CAJAMARCA');
INSERT INTO ubigeo VALUES (17292156, 'SAN MARTIN', 'RIOJA', 'ELIAS SOPLIN');
INSERT INTO ubigeo VALUES (17302157, 'SAN MARTIN', 'RIOJA', 'SAN FERNANDO');
INSERT INTO ubigeo VALUES (17312158, 'SAN MARTIN', 'RIOJA', 'PARDO MIGUEL');
INSERT INTO ubigeo VALUES (17322159, 'SAN MARTIN', 'RIOJA', 'AWAJUN');
INSERT INTO ubigeo VALUES (17332161, 'SAN MARTIN', 'SAN MARTIN', 'TARAPOTO');
INSERT INTO ubigeo VALUES (17342162, 'SAN MARTIN', 'SAN MARTIN', 'ALBERTO LEVEAU');
INSERT INTO ubigeo VALUES (17352164, 'SAN MARTIN', 'SAN MARTIN', 'CACATACHI');
INSERT INTO ubigeo VALUES (17362166, 'SAN MARTIN', 'SAN MARTIN', 'CHAZUTA');
INSERT INTO ubigeo VALUES (17372167, 'SAN MARTIN', 'SAN MARTIN', 'CHIPURANA');
INSERT INTO ubigeo VALUES (17382168, 'SAN MARTIN', 'SAN MARTIN', 'EL PORVENIR');
INSERT INTO ubigeo VALUES (17392169, 'SAN MARTIN', 'SAN MARTIN', 'HUIMBAYOC');
INSERT INTO ubigeo VALUES (17472171, 'SAN MARTIN', 'BELLAVISTA', 'BELLAVISTA');
INSERT INTO ubigeo VALUES (17482172, 'SAN MARTIN', 'BELLAVISTA', 'SAN RAFAEL');
INSERT INTO ubigeo VALUES (17492173, 'SAN MARTIN', 'BELLAVISTA', 'SAN PABLO');
INSERT INTO ubigeo VALUES (17502174, 'SAN MARTIN', 'BELLAVISTA', 'ALTO BIAVO');
INSERT INTO ubigeo VALUES (17512175, 'SAN MARTIN', 'BELLAVISTA', 'HUALLAGA');
INSERT INTO ubigeo VALUES (17522176, 'SAN MARTIN', 'BELLAVISTA', 'BAJO BIAVO');
INSERT INTO ubigeo VALUES (17532181, 'SAN MARTIN', 'TOCACHE', 'TOCACHE');
INSERT INTO ubigeo VALUES (17542182, 'SAN MARTIN', 'TOCACHE', 'NUEVO PROGRESO');
INSERT INTO ubigeo VALUES (17552183, 'SAN MARTIN', 'TOCACHE', 'POLVORA');
INSERT INTO ubigeo VALUES (17562184, 'SAN MARTIN', 'TOCACHE', 'SHUNTE');
INSERT INTO ubigeo VALUES (17572185, 'SAN MARTIN', 'TOCACHE', 'UCHIZA');
INSERT INTO ubigeo VALUES (17582191, 'SAN MARTIN', 'PICOTA', 'PICOTA');
INSERT INTO ubigeo VALUES (17592192, 'SAN MARTIN', 'PICOTA', 'BUENOS AIRES');
INSERT INTO ubigeo VALUES (17602193, 'SAN MARTIN', 'PICOTA', 'CASPIZAPA');
INSERT INTO ubigeo VALUES (17612194, 'SAN MARTIN', 'PICOTA', 'PILLUANA');
INSERT INTO ubigeo VALUES (17622195, 'SAN MARTIN', 'PICOTA', 'PUCACACA');
INSERT INTO ubigeo VALUES (17632196, 'SAN MARTIN', 'PICOTA', 'SAN CRISTOBAL');
INSERT INTO ubigeo VALUES (17642197, 'SAN MARTIN', 'PICOTA', 'SAN HILARION');
INSERT INTO ubigeo VALUES (17652198, 'SAN MARTIN', 'PICOTA', 'TINGO DE PONASA');
INSERT INTO ubigeo VALUES (17662199, 'SAN MARTIN', 'PICOTA', 'TRES UNIDOS');
INSERT INTO ubigeo VALUES (17732211, 'TACNA', 'TACNA', 'TACNA');
INSERT INTO ubigeo VALUES (17742212, 'TACNA', 'TACNA', 'CALANA');
INSERT INTO ubigeo VALUES (17752214, 'TACNA', 'TACNA', 'INCLAN');
INSERT INTO ubigeo VALUES (17762217, 'TACNA', 'TACNA', 'PACHIA');
INSERT INTO ubigeo VALUES (17772218, 'TACNA', 'TACNA', 'PALCA');
INSERT INTO ubigeo VALUES (17782219, 'TACNA', 'TACNA', 'POCOLLAY');
INSERT INTO ubigeo VALUES (17832221, 'TACNA', 'TARATA', 'TARATA');
INSERT INTO ubigeo VALUES (17842225, 'TACNA', 'TARATA', 'HEROES ALBARRACIN');
INSERT INTO ubigeo VALUES (17852226, 'TACNA', 'TARATA', 'ESTIQUE');
INSERT INTO ubigeo VALUES (17862227, 'TACNA', 'TARATA', 'ESTIQUE PAMPA');
INSERT INTO ubigeo VALUES (17912231, 'TACNA', 'JORGE BASADRE', 'LOCUMBA');
INSERT INTO ubigeo VALUES (17922232, 'TACNA', 'JORGE BASADRE', 'ITE');
INSERT INTO ubigeo VALUES (17932233, 'TACNA', 'JORGE BASADRE', 'ILABAYA');
INSERT INTO ubigeo VALUES (17942241, 'TACNA', 'CANDARAVE', 'CANDARAVE');
INSERT INTO ubigeo VALUES (17952242, 'TACNA', 'CANDARAVE', 'CAIRANI');
INSERT INTO ubigeo VALUES (17962243, 'TACNA', 'CANDARAVE', 'CURIBAYA');
INSERT INTO ubigeo VALUES (17972244, 'TACNA', 'CANDARAVE', 'HUANUARA');
INSERT INTO ubigeo VALUES (17982245, 'TACNA', 'CANDARAVE', 'QUILAHUANI');
INSERT INTO ubigeo VALUES (17992246, 'TACNA', 'CANDARAVE', 'CAMILACA');
INSERT INTO ubigeo VALUES (18002311, 'TUMBES', 'TUMBES', 'TUMBES');
INSERT INTO ubigeo VALUES (18012312, 'TUMBES', 'TUMBES', 'CORRALES');
INSERT INTO ubigeo VALUES (18022313, 'TUMBES', 'TUMBES', 'LA CRUZ');
INSERT INTO ubigeo VALUES (18032314, 'TUMBES', 'TUMBES', 'PAMPAS DE HOSPITAL');
INSERT INTO ubigeo VALUES (18042315, 'TUMBES', 'TUMBES', 'SAN JACINTO');
INSERT INTO ubigeo VALUES (18052316, 'TUMBES', 'TUMBES', 'SAN JUAN DE LA VIRGEN');
INSERT INTO ubigeo VALUES (18062321, 'TUMBES', 'CONTRALMIRANTE VILLAR', 'ZORRITOS');
INSERT INTO ubigeo VALUES (18072322, 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CASITAS');
INSERT INTO ubigeo VALUES (18082323, 'TUMBES', 'CONTRALMIRANTE VILLAR', 'CANOAS DE PUNTA SAL');
INSERT INTO ubigeo VALUES (18092331, 'TUMBES', 'ZARUMILLA', 'ZARUMILLA');
INSERT INTO ubigeo VALUES (18102332, 'TUMBES', 'ZARUMILLA', 'MATAPALO');
INSERT INTO ubigeo VALUES (18112333, 'TUMBES', 'ZARUMILLA', 'PAPAYAL');
INSERT INTO ubigeo VALUES (18121010, 'ANCASH', 'PALLASCA', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (18122334, 'TUMBES', 'ZARUMILLA', 'AGUAS VERDES');
INSERT INTO ubigeo VALUES (18132411, 'REGION CALLAO', 'CALLAO', 'CALLAO');
INSERT INTO ubigeo VALUES (18142412, 'REGION CALLAO', 'CALLAO', 'BELLAVISTA');
INSERT INTO ubigeo VALUES (18152413, 'REGION CALLAO', 'CALLAO', 'LA PUNTA');
INSERT INTO ubigeo VALUES (18162414, 'REGION CALLAO', 'CALLAO', 'CARMEN DE LA LEGUA-REYNOSO');
INSERT INTO ubigeo VALUES (18172415, 'REGION CALLAO', 'CALLAO', 'LA PERLA');
INSERT INTO ubigeo VALUES (18182416, 'REGION CALLAO', 'CALLAO', 'VENTANILLA');
INSERT INTO ubigeo VALUES (18192511, 'UCAYALI', 'CORONEL PORTILLO', 'CALLERIA');
INSERT INTO ubigeo VALUES (18202512, 'UCAYALI', 'CORONEL PORTILLO', 'YARINACOCHA');
INSERT INTO ubigeo VALUES (18212513, 'UCAYALI', 'CORONEL PORTILLO', 'MASISEA');
INSERT INTO ubigeo VALUES (18221011, 'ANCASH', 'PALLASCA', 'TAUCA');
INSERT INTO ubigeo VALUES (18222514, 'UCAYALI', 'CORONEL PORTILLO', 'CAMPOVERDE');
INSERT INTO ubigeo VALUES (18232515, 'UCAYALI', 'CORONEL PORTILLO', 'IPARIA');
INSERT INTO ubigeo VALUES (18242516, 'UCAYALI', 'CORONEL PORTILLO', 'NUEVA REQUENA');
INSERT INTO ubigeo VALUES (18252517, 'UCAYALI', 'CORONEL PORTILLO', 'MANANTAY');
INSERT INTO ubigeo VALUES (18262521, 'UCAYALI', 'PADRE ABAD', 'PADRE ABAD');
INSERT INTO ubigeo VALUES (18272522, 'UCAYALI', 'PADRE ABAD', 'YRAZOLA');
INSERT INTO ubigeo VALUES (18282523, 'UCAYALI', 'PADRE ABAD', 'CURIMANA');
INSERT INTO ubigeo VALUES (18292531, 'UCAYALI', 'ATALAYA', 'RAIMONDI');
INSERT INTO ubigeo VALUES (18302532, 'UCAYALI', 'ATALAYA', 'TAHUANIA');
INSERT INTO ubigeo VALUES (18312533, 'UCAYALI', 'ATALAYA', 'YURUA');
INSERT INTO ubigeo VALUES (18322534, 'UCAYALI', 'ATALAYA', 'SEPAHUA');
INSERT INTO ubigeo VALUES (18332541, 'UCAYALI', 'PURUS', 'PURUS');
INSERT INTO ubigeo VALUES (19621210, 'ANCASH', 'RECUAY', 'CATAC');
INSERT INTO ubigeo VALUES (21521410, 'ANCASH', 'SIHUAS', 'SAN JUAN');
INSERT INTO ubigeo VALUES (24922010, 'ANCASH', 'OCROS', 'SANTIAGO DE CHILCAS');
INSERT INTO ubigeo VALUES (53851010, 'AYACUCHO', 'PAUCAR DEL SARA SARA', 'SARA SARA');
INSERT INTO ubigeo VALUES (54851110, 'AYACUCHO', 'SUCRE', 'CHILCAYOC');
INSERT INTO ubigeo VALUES (54951111, 'AYACUCHO', 'SUCRE', 'MORCOLLA');
INSERT INTO ubigeo VALUES (65561010, 'CAJAMARCA', 'SAN MIGUEL', 'UNION AGUA BLANCA');
INSERT INTO ubigeo VALUES (65661011, 'CAJAMARCA', 'SAN MIGUEL', 'TONGOD');
INSERT INTO ubigeo VALUES (65761012, 'CAJAMARCA', 'SAN MIGUEL', 'CATILLUC');
INSERT INTO ubigeo VALUES (65861013, 'CAJAMARCA', 'SAN MIGUEL', 'BOLIVAR');
INSERT INTO ubigeo VALUES (77571210, 'CUSCO', 'QUISPICANCHI', 'OCONGATE');
INSERT INTO ubigeo VALUES (77671211, 'CUSCO', 'QUISPICANCHI', 'OROPESA');
INSERT INTO ubigeo VALUES (77771212, 'CUSCO', 'QUISPICANCHI', 'QUIQUIJANA');
INSERT INTO ubigeo VALUES (96410110, 'ICA', 'ICA', 'SUBTANJALLA');
INSERT INTO ubigeo VALUES (96510111, 'ICA', 'ICA', 'YAUCA DEL ROSARIO');
INSERT INTO ubigeo VALUES (96610112, 'ICA', 'ICA', 'TATE');
INSERT INTO ubigeo VALUES (96710113, 'ICA', 'ICA', 'PACHACUTEC');
INSERT INTO ubigeo VALUES (96810114, 'ICA', 'ICA', 'OCUCAJE');
INSERT INTO ubigeo VALUES (97810210, 'ICA', 'CHINCHA', 'PUEBLO NUEVO');
INSERT INTO ubigeo VALUES (97910211, 'ICA', 'CHINCHA', 'SAN JUAN DE YANAC');
INSERT INTO ubigeo VALUES (100611112, 'JUNIN', 'HUANCAYO', 'CHUPURO');
INSERT INTO ubigeo VALUES (100711113, 'JUNIN', 'HUANCAYO', 'EL TAMBO');
INSERT INTO ubigeo VALUES (100811114, 'JUNIN', 'HUANCAYO', 'HUACRAPUQUIO');
INSERT INTO ubigeo VALUES (100911116, 'JUNIN', 'HUANCAYO', 'HUALHUAS');
INSERT INTO ubigeo VALUES (101011118, 'JUNIN', 'HUANCAYO', 'HUANCAN');
INSERT INTO ubigeo VALUES (101111119, 'JUNIN', 'HUANCAYO', 'HUASICANCHA');
INSERT INTO ubigeo VALUES (101211120, 'JUNIN', 'HUANCAYO', 'HUAYUCACHI');
INSERT INTO ubigeo VALUES (101311121, 'JUNIN', 'HUANCAYO', 'INGENIO');
INSERT INTO ubigeo VALUES (101411122, 'JUNIN', 'HUANCAYO', 'PARIAHUANCA');
INSERT INTO ubigeo VALUES (101511123, 'JUNIN', 'HUANCAYO', 'PILCOMAYO');
INSERT INTO ubigeo VALUES (101611124, 'JUNIN', 'HUANCAYO', 'PUCARA');
INSERT INTO ubigeo VALUES (101711125, 'JUNIN', 'HUANCAYO', 'QUICHUAY');
INSERT INTO ubigeo VALUES (101811126, 'JUNIN', 'HUANCAYO', 'QUILCAS');
INSERT INTO ubigeo VALUES (101911127, 'JUNIN', 'HUANCAYO', 'SAN AGUSTIN');
INSERT INTO ubigeo VALUES (102011128, 'JUNIN', 'HUANCAYO', 'SAN JERONIMO DE TUNAN');
INSERT INTO ubigeo VALUES (102111131, 'JUNIN', 'HUANCAYO', 'STO DOMINGO DE ACOBAMBA');
INSERT INTO ubigeo VALUES (102211132, 'JUNIN', 'HUANCAYO', 'SANO');
INSERT INTO ubigeo VALUES (102311133, 'JUNIN', 'HUANCAYO', 'SAPALLANGA');
INSERT INTO ubigeo VALUES (102411134, 'JUNIN', 'HUANCAYO', 'SICAYA');
INSERT INTO ubigeo VALUES (102511136, 'JUNIN', 'HUANCAYO', 'VIQUES');
INSERT INTO ubigeo VALUES (103511210, 'JUNIN', 'CONCEPCION', 'MATAHUASI');
INSERT INTO ubigeo VALUES (103611211, 'JUNIN', 'CONCEPCION', 'MITO');
INSERT INTO ubigeo VALUES (103711212, 'JUNIN', 'CONCEPCION', 'NUEVE DE JULIO');
INSERT INTO ubigeo VALUES (103811213, 'JUNIN', 'CONCEPCION', 'ORCOTUNA');
INSERT INTO ubigeo VALUES (103911214, 'JUNIN', 'CONCEPCION', 'STA ROSA DE OCOPA');
INSERT INTO ubigeo VALUES (104011215, 'JUNIN', 'CONCEPCION', 'SAN JOSE DE QUERO');
INSERT INTO ubigeo VALUES (105011310, 'JUNIN', 'JAUJA', 'JANJAILLO');
INSERT INTO ubigeo VALUES (105111311, 'JUNIN', 'JAUJA', 'JULCAN');
INSERT INTO ubigeo VALUES (105211312, 'JUNIN', 'JAUJA', 'LEONOR ORDONEZ');
INSERT INTO ubigeo VALUES (105311313, 'JUNIN', 'JAUJA', 'LLOCLLAPAMPA');
INSERT INTO ubigeo VALUES (105411314, 'JUNIN', 'JAUJA', 'MARCO');
INSERT INTO ubigeo VALUES (105511315, 'JUNIN', 'JAUJA', 'MASMA');
INSERT INTO ubigeo VALUES (105611316, 'JUNIN', 'JAUJA', 'MOLINOS');
INSERT INTO ubigeo VALUES (105711317, 'JUNIN', 'JAUJA', 'MONOBAMBA');
INSERT INTO ubigeo VALUES (105811318, 'JUNIN', 'JAUJA', 'MUQUI');
INSERT INTO ubigeo VALUES (105911319, 'JUNIN', 'JAUJA', 'MUQUIYAUYO');
INSERT INTO ubigeo VALUES (106011320, 'JUNIN', 'JAUJA', 'PACA');
INSERT INTO ubigeo VALUES (106111321, 'JUNIN', 'JAUJA', 'PACCHA');
INSERT INTO ubigeo VALUES (106211322, 'JUNIN', 'JAUJA', 'PANCAN');
INSERT INTO ubigeo VALUES (106311323, 'JUNIN', 'JAUJA', 'PARCO');
INSERT INTO ubigeo VALUES (106411324, 'JUNIN', 'JAUJA', 'POMACANCHA');
INSERT INTO ubigeo VALUES (106511325, 'JUNIN', 'JAUJA', 'RICRAN');
INSERT INTO ubigeo VALUES (106611326, 'JUNIN', 'JAUJA', 'SAN LORENZO');
INSERT INTO ubigeo VALUES (106711327, 'JUNIN', 'JAUJA', 'SAN PEDRO DE CHUNAN');
INSERT INTO ubigeo VALUES (106811328, 'JUNIN', 'JAUJA', 'SINCOS');
INSERT INTO ubigeo VALUES (106911329, 'JUNIN', 'JAUJA', 'TUNAN MARCA');
INSERT INTO ubigeo VALUES (107011330, 'JUNIN', 'JAUJA', 'YAULI');
INSERT INTO ubigeo VALUES (107111331, 'JUNIN', 'JAUJA', 'CURICACA');
INSERT INTO ubigeo VALUES (107211332, 'JUNIN', 'JAUJA', 'MASMA CHICCHE');
INSERT INTO ubigeo VALUES (107311333, 'JUNIN', 'JAUJA', 'SAUSA');
INSERT INTO ubigeo VALUES (107411334, 'JUNIN', 'JAUJA', 'YAUYOS');
INSERT INTO ubigeo VALUES (109711610, 'JUNIN', 'YAULI', 'STA ROSA DE SACCO');
INSERT INTO ubigeo VALUES (112912110, 'LA LIBERTAD', 'TRUJILLO', 'EL PORVENIR');
INSERT INTO ubigeo VALUES (113012111, 'LA LIBERTAD', 'TRUJILLO', 'LA ESPERANZA');
INSERT INTO ubigeo VALUES (113112112, 'LA LIBERTAD', 'TRUJILLO', 'FLORENCIA DE MORA');
INSERT INTO ubigeo VALUES (115312410, 'LA LIBERTAD', 'OTUZCO', 'SINSICAP');
INSERT INTO ubigeo VALUES (115412411, 'LA LIBERTAD', 'OTUZCO', 'USQUIL');
INSERT INTO ubigeo VALUES (115512413, 'LA LIBERTAD', 'OTUZCO', 'MACHE');
INSERT INTO ubigeo VALUES (117012610, 'LA LIBERTAD', 'PATAZ', 'PIAS');
INSERT INTO ubigeo VALUES (117112611, 'LA LIBERTAD', 'PATAZ', 'TAURIJA');
INSERT INTO ubigeo VALUES (117212612, 'LA LIBERTAD', 'PATAZ', 'URPAY');
INSERT INTO ubigeo VALUES (117312613, 'LA LIBERTAD', 'PATAZ', 'SANTIAGO DE CHALLAS');
INSERT INTO ubigeo VALUES (119312101, 'LA LIBERTAD', 'JULCAN', 'JULCAN');
INSERT INTO ubigeo VALUES (119412102, 'LA LIBERTAD', 'JULCAN', 'CARABAMBA');
INSERT INTO ubigeo VALUES (119512103, 'LA LIBERTAD', 'JULCAN', 'CALAMARCA');
INSERT INTO ubigeo VALUES (119612104, 'LA LIBERTAD', 'JULCAN', 'HUASO');
INSERT INTO ubigeo VALUES (119712111, 'LA LIBERTAD', 'GRAN CHIMU', 'CASCAS');
INSERT INTO ubigeo VALUES (119812112, 'LA LIBERTAD', 'GRAN CHIMU', 'LUCMA');
INSERT INTO ubigeo VALUES (119912113, 'LA LIBERTAD', 'GRAN CHIMU', 'MARMOT');
INSERT INTO ubigeo VALUES (120012114, 'LA LIBERTAD', 'GRAN CHIMU', 'SAYAPULLO');
INSERT INTO ubigeo VALUES (120112121, 'LA LIBERTAD', 'VIRU', 'VIRU');
INSERT INTO ubigeo VALUES (120212122, 'LA LIBERTAD', 'VIRU', 'CHAO');
INSERT INTO ubigeo VALUES (120312123, 'LA LIBERTAD', 'VIRU', 'GUADALUPITO');
INSERT INTO ubigeo VALUES (121313110, 'LAMBAYEQUE', 'CHICLAYO', 'PIMENTEL');
INSERT INTO ubigeo VALUES (121413111, 'LAMBAYEQUE', 'CHICLAYO', 'REQUE');
INSERT INTO ubigeo VALUES (121513112, 'LAMBAYEQUE', 'CHICLAYO', 'JOSE LEONARDO ORTIZ');
INSERT INTO ubigeo VALUES (121613113, 'LAMBAYEQUE', 'CHICLAYO', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (121713114, 'LAMBAYEQUE', 'CHICLAYO', 'SANA');
INSERT INTO ubigeo VALUES (121813115, 'LAMBAYEQUE', 'CHICLAYO', 'LA VICTORIA');
INSERT INTO ubigeo VALUES (121913116, 'LAMBAYEQUE', 'CHICLAYO', 'CAYALTI');
INSERT INTO ubigeo VALUES (122013117, 'LAMBAYEQUE', 'CHICLAYO', 'PATAPO');
INSERT INTO ubigeo VALUES (122113118, 'LAMBAYEQUE', 'CHICLAYO', 'POMALCA');
INSERT INTO ubigeo VALUES (122213119, 'LAMBAYEQUE', 'CHICLAYO', 'PUCALA');
INSERT INTO ubigeo VALUES (122313120, 'LAMBAYEQUE', 'CHICLAYO', 'TUMAN');
INSERT INTO ubigeo VALUES (123913310, 'LAMBAYEQUE', 'LAMBAYEQUE', 'SALAS');
INSERT INTO ubigeo VALUES (124013311, 'LAMBAYEQUE', 'LAMBAYEQUE', 'SAN JOSE');
INSERT INTO ubigeo VALUES (124113312, 'LAMBAYEQUE', 'LAMBAYEQUE', 'TUCUME');
INSERT INTO ubigeo VALUES (125114110, 'LIMA', 'LIMA', 'LA MOLINA');
INSERT INTO ubigeo VALUES (125214111, 'LIMA', 'LIMA', 'LINCE');
INSERT INTO ubigeo VALUES (125314112, 'LIMA', 'LIMA', 'LURIGANCHO');
INSERT INTO ubigeo VALUES (125414113, 'LIMA', 'LIMA', 'LURIN');
INSERT INTO ubigeo VALUES (125514114, 'LIMA', 'LIMA', 'MAGDALENA DEL MAR');
INSERT INTO ubigeo VALUES (125614115, 'LIMA', 'LIMA', 'MIRAFLORES');
INSERT INTO ubigeo VALUES (125714116, 'LIMA', 'LIMA', 'PACHACAMAC');
INSERT INTO ubigeo VALUES (125814117, 'LIMA', 'LIMA', 'PUEBLO LIBRE');
INSERT INTO ubigeo VALUES (125914118, 'LIMA', 'LIMA', 'PUCUSANA');
INSERT INTO ubigeo VALUES (126014119, 'LIMA', 'LIMA', 'PUENTE PIEDRA');
INSERT INTO ubigeo VALUES (126114120, 'LIMA', 'LIMA', 'PUNTA HERMOSA');
INSERT INTO ubigeo VALUES (126214121, 'LIMA', 'LIMA', 'PUNTA NEGRA');
INSERT INTO ubigeo VALUES (126314122, 'LIMA', 'LIMA', 'RIMAC');
INSERT INTO ubigeo VALUES (126414123, 'LIMA', 'LIMA', 'SAN BARTOLO');
INSERT INTO ubigeo VALUES (126514124, 'LIMA', 'LIMA', 'SAN ISIDRO');
INSERT INTO ubigeo VALUES (126614125, 'LIMA', 'LIMA', 'BARRANCO');
INSERT INTO ubigeo VALUES (126714126, 'LIMA', 'LIMA', 'SAN MARTIN DE PORRES');
INSERT INTO ubigeo VALUES (126814127, 'LIMA', 'LIMA', 'SAN MIGUEL');
INSERT INTO ubigeo VALUES (126914128, 'LIMA', 'LIMA', 'STA MARIA DEL MAR');
INSERT INTO ubigeo VALUES (127014129, 'LIMA', 'LIMA', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (127114130, 'LIMA', 'LIMA', 'SANTIAGO DE SURCO');
INSERT INTO ubigeo VALUES (127214131, 'LIMA', 'LIMA', 'SURQUILLO');
INSERT INTO ubigeo VALUES (127314132, 'LIMA', 'LIMA', 'VILLA MARIA DEL TRIUNFO');
INSERT INTO ubigeo VALUES (127414133, 'LIMA', 'LIMA', 'JESUS MARIA');
INSERT INTO ubigeo VALUES (127514134, 'LIMA', 'LIMA', 'INDEPENDENCIA');
INSERT INTO ubigeo VALUES (127614135, 'LIMA', 'LIMA', 'EL AGUSTINO');
INSERT INTO ubigeo VALUES (127714136, 'LIMA', 'LIMA', 'SAN JUAN DE MIRAFLORES');
INSERT INTO ubigeo VALUES (127814137, 'LIMA', 'LIMA', 'SAN JUAN DE LURIGANCHO');
INSERT INTO ubigeo VALUES (127914138, 'LIMA', 'LIMA', 'SAN LUIS');
INSERT INTO ubigeo VALUES (128014139, 'LIMA', 'LIMA', 'CIENEGUILLA');
INSERT INTO ubigeo VALUES (128114140, 'LIMA', 'LIMA', 'SAN BORJA');
INSERT INTO ubigeo VALUES (128214141, 'LIMA', 'LIMA', 'VILLA EL SALVADOR');
INSERT INTO ubigeo VALUES (128314142, 'LIMA', 'LIMA', 'LOS OLIVOS');
INSERT INTO ubigeo VALUES (128414143, 'LIMA', 'LIMA', 'SANTA ANITA');
INSERT INTO ubigeo VALUES (130614410, 'LIMA', 'CANETE', 'PACARAN');
INSERT INTO ubigeo VALUES (130714411, 'LIMA', 'CANETE', 'QUILMANA');
INSERT INTO ubigeo VALUES (130814412, 'LIMA', 'CANETE', 'SAN ANTONIO');
INSERT INTO ubigeo VALUES (130914413, 'LIMA', 'CANETE', 'SAN LUIS');
INSERT INTO ubigeo VALUES (131014414, 'LIMA', 'CANETE', 'SANTA CRUZ DE FLORES');
INSERT INTO ubigeo VALUES (131114415, 'LIMA', 'CANETE', 'ZUNIGA');
INSERT INTO ubigeo VALUES (131214416, 'LIMA', 'CANETE', 'ASIA');
INSERT INTO ubigeo VALUES (132114511, 'LIMA', 'HUAURA', 'SANTA LEONOR');
INSERT INTO ubigeo VALUES (132214512, 'LIMA', 'HUAURA', 'SANTA MARIA');
INSERT INTO ubigeo VALUES (132314513, 'LIMA', 'HUAURA', 'SAYAN');
INSERT INTO ubigeo VALUES (132414516, 'LIMA', 'HUAURA', 'VEGUETA');
INSERT INTO ubigeo VALUES (133414610, 'LIMA', 'HUAROCHIRI', 'LAHUAYTAMBO');
INSERT INTO ubigeo VALUES (133514611, 'LIMA', 'HUAROCHIRI', 'LANGA');
INSERT INTO ubigeo VALUES (133614612, 'LIMA', 'HUAROCHIRI', 'MARIATANA');
INSERT INTO ubigeo VALUES (133714613, 'LIMA', 'HUAROCHIRI', 'RICARDO PALMA');
INSERT INTO ubigeo VALUES (133814614, 'LIMA', 'HUAROCHIRI', 'SAN ANDRES DE TUPICOCHA');
INSERT INTO ubigeo VALUES (133914615, 'LIMA', 'HUAROCHIRI', 'SAN ANTONIO');
INSERT INTO ubigeo VALUES (134014616, 'LIMA', 'HUAROCHIRI', 'SAN BARTOLOME');
INSERT INTO ubigeo VALUES (134114617, 'LIMA', 'HUAROCHIRI', 'SAN DAMIAN');
INSERT INTO ubigeo VALUES (134214618, 'LIMA', 'HUAROCHIRI', 'SANGALLAYA');
INSERT INTO ubigeo VALUES (134314619, 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE TANTARANCHE');
INSERT INTO ubigeo VALUES (134414620, 'LIMA', 'HUAROCHIRI', 'SAN LORENZO DE QUINTI');
INSERT INTO ubigeo VALUES (134514621, 'LIMA', 'HUAROCHIRI', 'SAN MATEO');
INSERT INTO ubigeo VALUES (134614622, 'LIMA', 'HUAROCHIRI', 'SAN MATEO DE OTAO');
INSERT INTO ubigeo VALUES (134714623, 'LIMA', 'HUAROCHIRI', 'SAN PEDRO DE HUANCAYRE');
INSERT INTO ubigeo VALUES (134814624, 'LIMA', 'HUAROCHIRI', 'SANTA CRUZ DE COCACHACRA');
INSERT INTO ubigeo VALUES (134914625, 'LIMA', 'HUAROCHIRI', 'SANTA EULALIA');
INSERT INTO ubigeo VALUES (135014626, 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE ANCHUCAYA');
INSERT INTO ubigeo VALUES (135114627, 'LIMA', 'HUAROCHIRI', 'SANTIAGO DE TUNA');
INSERT INTO ubigeo VALUES (135214628, 'LIMA', 'HUAROCHIRI', 'SANTO DOMINGO DE LOS OLLEROS');
INSERT INTO ubigeo VALUES (135314629, 'LIMA', 'HUAROCHIRI', 'SURCO');
INSERT INTO ubigeo VALUES (135414630, 'LIMA', 'HUAROCHIRI', 'HUACHUPAMPA');
INSERT INTO ubigeo VALUES (135514631, 'LIMA', 'HUAROCHIRI', 'LARAOS');
INSERT INTO ubigeo VALUES (135614632, 'LIMA', 'HUAROCHIRI', 'SAN JUAN DE IRIS');
INSERT INTO ubigeo VALUES (136614710, 'LIMA', 'YAUYOS', 'CHOCOS');
INSERT INTO ubigeo VALUES (136714711, 'LIMA', 'YAUYOS', 'HUAMPARA');
INSERT INTO ubigeo VALUES (136814712, 'LIMA', 'YAUYOS', 'HUANCAYA');
INSERT INTO ubigeo VALUES (136914713, 'LIMA', 'YAUYOS', 'HUANGASCAR');
INSERT INTO ubigeo VALUES (137014714, 'LIMA', 'YAUYOS', 'HUANTAN');
INSERT INTO ubigeo VALUES (137114715, 'LIMA', 'YAUYOS', 'HUANEC');
INSERT INTO ubigeo VALUES (137214716, 'LIMA', 'YAUYOS', 'LARAOS');
INSERT INTO ubigeo VALUES (137314717, 'LIMA', 'YAUYOS', 'LINCHA');
INSERT INTO ubigeo VALUES (137414718, 'LIMA', 'YAUYOS', 'MIRAFLORES');
INSERT INTO ubigeo VALUES (137514719, 'LIMA', 'YAUYOS', 'OMAS');
INSERT INTO ubigeo VALUES (137614720, 'LIMA', 'YAUYOS', 'QUINCHES');
INSERT INTO ubigeo VALUES (137714721, 'LIMA', 'YAUYOS', 'QUINOCAY');
INSERT INTO ubigeo VALUES (137814722, 'LIMA', 'YAUYOS', 'SAN JOAQUIN');
INSERT INTO ubigeo VALUES (137914723, 'LIMA', 'YAUYOS', 'SAN PEDRO DE PILAS');
INSERT INTO ubigeo VALUES (138014724, 'LIMA', 'YAUYOS', 'TANTA');
INSERT INTO ubigeo VALUES (138114725, 'LIMA', 'YAUYOS', 'TAURIPAMPA');
INSERT INTO ubigeo VALUES (138214726, 'LIMA', 'YAUYOS', 'TUPE');
INSERT INTO ubigeo VALUES (138314727, 'LIMA', 'YAUYOS', 'TOMAS');
INSERT INTO ubigeo VALUES (138414728, 'LIMA', 'YAUYOS', 'VINAC');
INSERT INTO ubigeo VALUES (138514729, 'LIMA', 'YAUYOS', 'VITIS');
INSERT INTO ubigeo VALUES (138614730, 'LIMA', 'YAUYOS', 'HONGOS');
INSERT INTO ubigeo VALUES (138714731, 'LIMA', 'YAUYOS', 'MADEAN');
INSERT INTO ubigeo VALUES (138814732, 'LIMA', 'YAUYOS', 'PUTINZA');
INSERT INTO ubigeo VALUES (138914733, 'LIMA', 'YAUYOS', 'CATAHUASI');
INSERT INTO ubigeo VALUES (139914810, 'LIMA', 'HUARAL', 'VEINTISIETE DE NOVIEMBRE');
INSERT INTO ubigeo VALUES (140014811, 'LIMA', 'HUARAL', 'STA CRUZ DE ANDAMARCA');
INSERT INTO ubigeo VALUES (140114812, 'LIMA', 'HUARAL', 'SUMBILCA');
INSERT INTO ubigeo VALUES (140714101, 'LIMA', 'OYON', 'OYON');
INSERT INTO ubigeo VALUES (140814102, 'LIMA', 'OYON', 'NAVAN');
INSERT INTO ubigeo VALUES (140914103, 'LIMA', 'OYON', 'CAUJUL');
INSERT INTO ubigeo VALUES (141014104, 'LIMA', 'OYON', 'ANDAJES');
INSERT INTO ubigeo VALUES (141114105, 'LIMA', 'OYON', 'PACHANGARA');
INSERT INTO ubigeo VALUES (141214106, 'LIMA', 'OYON', 'COCHAMARCA');
INSERT INTO ubigeo VALUES (142115110, 'LORETO', 'MAYNAS', 'INDIANA');
INSERT INTO ubigeo VALUES (142215111, 'LORETO', 'MAYNAS', 'PUNCHANA');
INSERT INTO ubigeo VALUES (142315112, 'LORETO', 'MAYNAS', 'BELEN');
INSERT INTO ubigeo VALUES (142415113, 'LORETO', 'MAYNAS', 'SAN JUAN BAUTISTA');
INSERT INTO ubigeo VALUES (142515114, 'LORETO', 'MAYNAS', 'TNTE MANUEL CLAVERO');
INSERT INTO ubigeo VALUES (143015210, 'LORETO', 'ALTO AMAZONAS', 'SANTA CRUZ');
INSERT INTO ubigeo VALUES (143115211, 'LORETO', 'ALTO AMAZONAS', 'TNTE CESAR LOPEZ ROJAS');
INSERT INTO ubigeo VALUES (144615410, 'LORETO', 'REQUENA', 'JENARO HERRERA');
INSERT INTO ubigeo VALUES (144715411, 'LORETO', 'REQUENA', 'YAQUERANA');
INSERT INTO ubigeo VALUES (149017210, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'UBINAS');
INSERT INTO ubigeo VALUES (149117211, 'MOQUEGUA', 'GENERAL SANCHEZ CERRO', 'YUNGA');
INSERT INTO ubigeo VALUES (150318110, 'PASCO', 'PASCO', 'SIMON BOLIVAR');
INSERT INTO ubigeo VALUES (150418111, 'PASCO', 'PASCO', 'TICLACAYAN');
INSERT INTO ubigeo VALUES (150518112, 'PASCO', 'PASCO', 'TINYAHUARCO');
INSERT INTO ubigeo VALUES (150618113, 'PASCO', 'PASCO', 'VICCO');
INSERT INTO ubigeo VALUES (150718114, 'PASCO', 'PASCO', 'YANACANCHA');
INSERT INTO ubigeo VALUES (153019113, 'PIURA', 'PIURA', 'CURA MORI');
INSERT INTO ubigeo VALUES (153119114, 'PIURA', 'PIURA', 'EL TALLAN');
INSERT INTO ubigeo VALUES (154119210, 'PIURA', 'AYABACA', 'PAIMAS');
INSERT INTO ubigeo VALUES (155919410, 'PIURA', 'MORROPON', 'SAN JUAN DE BIGOTE');
INSERT INTO ubigeo VALUES (159620110, 'PUNO', 'PUNO', 'PICHACANI');
INSERT INTO ubigeo VALUES (159720111, 'PUNO', 'PUNO', 'SAN ANTONIO');
INSERT INTO ubigeo VALUES (159820112, 'PUNO', 'PUNO', 'TIQUILLACA');
INSERT INTO ubigeo VALUES (159920113, 'PUNO', 'PUNO', 'VILQUE');
INSERT INTO ubigeo VALUES (160020114, 'PUNO', 'PUNO', 'PLATERIA');
INSERT INTO ubigeo VALUES (160120115, 'PUNO', 'PUNO', 'AMANTANI');
INSERT INTO ubigeo VALUES (161020210, 'PUNO', 'AZANGARO', 'POTONI');
INSERT INTO ubigeo VALUES (161120212, 'PUNO', 'AZANGARO', 'SAMAN');
INSERT INTO ubigeo VALUES (161220213, 'PUNO', 'AZANGARO', 'SAN ANTON');
INSERT INTO ubigeo VALUES (161320214, 'PUNO', 'AZANGARO', 'SAN JOSE');
INSERT INTO ubigeo VALUES (161420215, 'PUNO', 'AZANGARO', 'SAN JUAN DE SALINAS');
INSERT INTO ubigeo VALUES (161520216, 'PUNO', 'AZANGARO', 'STGO DE PUPUJA');
INSERT INTO ubigeo VALUES (161620217, 'PUNO', 'AZANGARO', 'TIRAPATA');
INSERT INTO ubigeo VALUES (162620310, 'PUNO', 'CARABAYA', 'USICAYOS');
INSERT INTO ubigeo VALUES (163220410, 'PUNO', 'CHUCUITO', 'ZEPITA');
INSERT INTO ubigeo VALUES (163320412, 'PUNO', 'CHUCUITO', 'KELLUYO');
INSERT INTO ubigeo VALUES (164120511, 'PUNO', 'HUANCANE', 'HUATASANI');
INSERT INTO ubigeo VALUES (165120610, 'PUNO', 'LAMPA', 'VILAVILA');
INSERT INTO ubigeo VALUES (166820810, 'PUNO', 'SANDIA', 'YANAHUAYA');
INSERT INTO ubigeo VALUES (166920811, 'PUNO', 'SANDIA', 'ALTO INAMBARI');
INSERT INTO ubigeo VALUES (167020812, 'PUNO', 'SANDIA', 'SAN PEDRO DE PUTINA PUNCO');
INSERT INTO ubigeo VALUES (167520101, 'PUNO', 'YUNGUYO', 'YUNGUYO');
INSERT INTO ubigeo VALUES (167620102, 'PUNO', 'YUNGUYO', 'UNICACHI');
INSERT INTO ubigeo VALUES (167720103, 'PUNO', 'YUNGUYO', 'ANAPIA');
INSERT INTO ubigeo VALUES (167820104, 'PUNO', 'YUNGUYO', 'COPANI');
INSERT INTO ubigeo VALUES (167920105, 'PUNO', 'YUNGUYO', 'CUTURAPI');
INSERT INTO ubigeo VALUES (168020106, 'PUNO', 'YUNGUYO', 'OLLARAYA');
INSERT INTO ubigeo VALUES (168120107, 'PUNO', 'YUNGUYO', 'TINICACHI');
INSERT INTO ubigeo VALUES (168220111, 'PUNO', 'SAN ANTONIO DE PUTINA', 'PUTINA');
INSERT INTO ubigeo VALUES (168320112, 'PUNO', 'SAN ANTONIO DE PUTINA', 'PEDRO VILCA APAZA');
INSERT INTO ubigeo VALUES (168420113, 'PUNO', 'SAN ANTONIO DE PUTINA', 'QUILCA PUNCU');
INSERT INTO ubigeo VALUES (168520114, 'PUNO', 'SAN ANTONIO DE PUTINA', 'ANANEA');
INSERT INTO ubigeo VALUES (168620115, 'PUNO', 'SAN ANTONIO DE PUTINA', 'SINA');
INSERT INTO ubigeo VALUES (168720121, 'PUNO', 'EL COLLAO', 'ILAVE');
INSERT INTO ubigeo VALUES (168820122, 'PUNO', 'EL COLLAO', 'PILCUYO');
INSERT INTO ubigeo VALUES (168920123, 'PUNO', 'EL COLLAO', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (169020124, 'PUNO', 'EL COLLAO', 'CAPASO');
INSERT INTO ubigeo VALUES (169120125, 'PUNO', 'EL COLLAO', 'CONDURIRI');
INSERT INTO ubigeo VALUES (169220131, 'PUNO', 'MOHO', 'MOHO');
INSERT INTO ubigeo VALUES (169320132, 'PUNO', 'MOHO', 'CONIMA');
INSERT INTO ubigeo VALUES (169420133, 'PUNO', 'MOHO', 'TILALI');
INSERT INTO ubigeo VALUES (169520134, 'PUNO', 'MOHO', 'HUAYRAPATA');
INSERT INTO ubigeo VALUES (171421311, 'SAN MARTIN', 'LAMAS', 'SHANAO');
INSERT INTO ubigeo VALUES (171521313, 'SAN MARTIN', 'LAMAS', 'TABALOSOS');
INSERT INTO ubigeo VALUES (171621314, 'SAN MARTIN', 'LAMAS', 'ZAPATERO');
INSERT INTO ubigeo VALUES (171721315, 'SAN MARTIN', 'LAMAS', 'ALONSO DE ALVARADO');
INSERT INTO ubigeo VALUES (171821316, 'SAN MARTIN', 'LAMAS', 'SAN ROQUE DE CUMBAZA');
INSERT INTO ubigeo VALUES (174021610, 'SAN MARTIN', 'SAN MARTIN', 'JUAN GUERRA');
INSERT INTO ubigeo VALUES (174121611, 'SAN MARTIN', 'SAN MARTIN', 'MORALES');
INSERT INTO ubigeo VALUES (174221612, 'SAN MARTIN', 'SAN MARTIN', 'PAPAPLAYA');
INSERT INTO ubigeo VALUES (174321616, 'SAN MARTIN', 'SAN MARTIN', 'SAN ANTONIO');
INSERT INTO ubigeo VALUES (174421619, 'SAN MARTIN', 'SAN MARTIN', 'SAUCE');
INSERT INTO ubigeo VALUES (174521620, 'SAN MARTIN', 'SAN MARTIN', 'SHAPAJA');
INSERT INTO ubigeo VALUES (174621621, 'SAN MARTIN', 'SAN MARTIN', 'LA BANDA DE SHILCAYO');
INSERT INTO ubigeo VALUES (176721910, 'SAN MARTIN', 'PICOTA', 'SHAMBOYACU');
INSERT INTO ubigeo VALUES (176821101, 'SAN MARTIN', 'EL DORADO', 'SAN JOSE DE SISA');
INSERT INTO ubigeo VALUES (176921102, 'SAN MARTIN', 'EL DORADO', 'AGUA BLANCA');
INSERT INTO ubigeo VALUES (177021103, 'SAN MARTIN', 'EL DORADO', 'SHATOJA');
INSERT INTO ubigeo VALUES (177121104, 'SAN MARTIN', 'EL DORADO', 'SAN MARTIN');
INSERT INTO ubigeo VALUES (177221105, 'SAN MARTIN', 'EL DORADO', 'SANTA ROSA');
INSERT INTO ubigeo VALUES (177922110, 'TACNA', 'TACNA', 'SAMA');
INSERT INTO ubigeo VALUES (178022111, 'TACNA', 'TACNA', 'ALTO DE LA ALIANZA');
INSERT INTO ubigeo VALUES (178122112, 'TACNA', 'TACNA', 'CIUDAD NUEVA');
INSERT INTO ubigeo VALUES (178222113, 'TACNA', 'TACNA', 'CORONEL GREGORIO ALBARRACIN L.');
INSERT INTO ubigeo VALUES (178722210, 'TACNA', 'TARATA', 'SITAJARA');
INSERT INTO ubigeo VALUES (178822211, 'TACNA', 'TARATA', 'SUSAPAYA');
INSERT INTO ubigeo VALUES (178922212, 'TACNA', 'TARATA', 'TARUCACHI');
INSERT INTO ubigeo VALUES (179022213, 'TACNA', 'TARATA', 'TICACO');


--
-- Name: ubigeo_id_ubigeo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('ubigeo_id_ubigeo_seq', 1, false);


--
-- Data for Name: unidad_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO unidad_medida VALUES (1, 'unidad', 'u', '1');
INSERT INTO unidad_medida VALUES (4, 'galones', 'gal', '1');
INSERT INTO unidad_medida VALUES (5, 'docena', 'doc', '1');
INSERT INTO unidad_medida VALUES (6, 'decenas', 'dec', '2');


--
-- Name: unidad_medida_id_unidadmedidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidad_medida_id_unidadmedidad_seq', 6, true);


--
-- Name: almacen_productos_alm_pro_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacen_productos
    ADD CONSTRAINT almacen_productos_alm_pro_id_key UNIQUE (alm_pro_id);


--
-- Name: almacenes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacenes
    ADD CONSTRAINT almacenes_pkey PRIMARY KEY (alm_id);


--
-- Name: compras_det_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compras_det
    ADD CONSTRAINT compras_det_pkey PRIMARY KEY (comp_det_id);


--
-- Name: compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (comp_id);


--
-- Name: pedido_compra_det_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido_compra_det
    ADD CONSTRAINT pedido_compra_det_pkey PRIMARY KEY (ped_det_id);


--
-- Name: pedido_compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pedido_compras
    ADD CONSTRAINT pedido_compras_pkey PRIMARY KEY (pec_id);


--
-- Name: pk_almacen_productos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY almacen_productos
    ADD CONSTRAINT pk_almacen_productos PRIMARY KEY (alm_pro_id);


--
-- Name: pk_area; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY area
    ADD CONSTRAINT pk_area PRIMARY KEY (id_area);


--
-- Name: pk_caracteristicas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY caracteristicas
    ADD CONSTRAINT pk_caracteristicas PRIMARY KEY (idcaracteristica);


--
-- Name: pk_categoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT pk_categoria PRIMARY KEY (idcategoria);


--
-- Name: pk_icono; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY iconos
    ADD CONSTRAINT pk_icono PRIMARY KEY (id_icono);


--
-- Name: pk_igv; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY igv
    ADD CONSTRAINT pk_igv PRIMARY KEY (id_igv);


--
-- Name: pk_linea; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY linea
    ADD CONSTRAINT pk_linea PRIMARY KEY (idlinea);


--
-- Name: pk_menu; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT pk_menu PRIMARY KEY (id_menu);


--
-- Name: pk_menu_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu_perfil
    ADD CONSTRAINT pk_menu_perfil PRIMARY KEY (id_menu_perfil);


--
-- Name: pk_perfil; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY perfil
    ADD CONSTRAINT pk_perfil PRIMARY KEY (id_perfil);


--
-- Name: pk_persona; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (id_per);


--
-- Name: pk_prod_caract; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producto_caracteristica
    ADD CONSTRAINT pk_prod_caract PRIMARY KEY (idproducto_caracteristica);


--
-- Name: pk_producto; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT pk_producto PRIMARY KEY (idproducto);


--
-- Name: pk_producto_unidadmedida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY producto_unidadmedida
    ADD CONSTRAINT pk_producto_unidadmedida PRIMARY KEY (id_producto_unidadmedida);


--
-- Name: pk_sucursal; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sucursal
    ADD CONSTRAINT pk_sucursal PRIMARY KEY (id_sucursal);


--
-- Name: pk_tipocategoria; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_categoria
    ADD CONSTRAINT pk_tipocategoria PRIMARY KEY (id_tipocategoria);


--
-- Name: pk_ubigeo; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ubigeo
    ADD CONSTRAINT pk_ubigeo PRIMARY KEY (id_ubigeo);


--
-- Name: pk_unidadmedida; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidad_medida
    ADD CONSTRAINT pk_unidadmedida PRIMARY KEY (id_unidadmedida);


--
-- Name: fki_almacen_sucursal; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_almacen_sucursal ON sucursal USING btree (idalmacen);


--
-- Name: fki_categoria_tipocategoria; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_categoria_tipocategoria ON categorias USING btree (categoria_padre);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: almacen_productos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE almacen_productos FROM PUBLIC;
REVOKE ALL ON TABLE almacen_productos FROM postgres;
GRANT ALL ON TABLE almacen_productos TO postgres;


--
-- Name: almacenes; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE almacenes FROM PUBLIC;
REVOKE ALL ON TABLE almacenes FROM postgres;
GRANT ALL ON TABLE almacenes TO postgres;


--
-- Name: area; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE area FROM PUBLIC;
REVOKE ALL ON TABLE area FROM postgres;
GRANT ALL ON TABLE area TO postgres;


--
-- Name: caracteristicas; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE caracteristicas FROM PUBLIC;
REVOKE ALL ON TABLE caracteristicas FROM postgres;
GRANT ALL ON TABLE caracteristicas TO postgres;


--
-- Name: categorias; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE categorias FROM PUBLIC;
REVOKE ALL ON TABLE categorias FROM postgres;
GRANT ALL ON TABLE categorias TO postgres;


--
-- Name: compras; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE compras FROM PUBLIC;
REVOKE ALL ON TABLE compras FROM postgres;
GRANT ALL ON TABLE compras TO postgres;


--
-- Name: compras_det; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE compras_det FROM PUBLIC;
REVOKE ALL ON TABLE compras_det FROM postgres;
GRANT ALL ON TABLE compras_det TO postgres;


--
-- Name: iconos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE iconos FROM PUBLIC;
REVOKE ALL ON TABLE iconos FROM postgres;
GRANT ALL ON TABLE iconos TO postgres;


--
-- Name: igv; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE igv FROM PUBLIC;
REVOKE ALL ON TABLE igv FROM postgres;
GRANT ALL ON TABLE igv TO postgres;


--
-- Name: linea; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE linea FROM PUBLIC;
REVOKE ALL ON TABLE linea FROM postgres;
GRANT ALL ON TABLE linea TO postgres;


--
-- Name: menu; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE menu FROM PUBLIC;
REVOKE ALL ON TABLE menu FROM postgres;
GRANT ALL ON TABLE menu TO postgres;


--
-- Name: menu_perfil; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE menu_perfil FROM PUBLIC;
REVOKE ALL ON TABLE menu_perfil FROM postgres;
GRANT ALL ON TABLE menu_perfil TO postgres;


--
-- Name: pedido_compra_det; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pedido_compra_det FROM PUBLIC;
REVOKE ALL ON TABLE pedido_compra_det FROM postgres;
GRANT ALL ON TABLE pedido_compra_det TO postgres;


--
-- Name: pedido_compras; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE pedido_compras FROM PUBLIC;
REVOKE ALL ON TABLE pedido_compras FROM postgres;
GRANT ALL ON TABLE pedido_compras TO postgres;


--
-- Name: perfil; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE perfil FROM PUBLIC;
REVOKE ALL ON TABLE perfil FROM postgres;
GRANT ALL ON TABLE perfil TO postgres;


--
-- Name: persona; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE persona FROM PUBLIC;
REVOKE ALL ON TABLE persona FROM postgres;
GRANT ALL ON TABLE persona TO postgres;


--
-- Name: producto_caracteristica; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE producto_caracteristica FROM PUBLIC;
REVOKE ALL ON TABLE producto_caracteristica FROM postgres;
GRANT ALL ON TABLE producto_caracteristica TO postgres;


--
-- Name: productos; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE productos FROM PUBLIC;
REVOKE ALL ON TABLE productos FROM postgres;
GRANT ALL ON TABLE productos TO postgres;


--
-- Name: producto_unidadmedida; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE producto_unidadmedida FROM PUBLIC;
REVOKE ALL ON TABLE producto_unidadmedida FROM postgres;
GRANT ALL ON TABLE producto_unidadmedida TO postgres;


--
-- Name: sucursal; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE sucursal FROM PUBLIC;
REVOKE ALL ON TABLE sucursal FROM postgres;
GRANT ALL ON TABLE sucursal TO postgres;


--
-- Name: tipo_categoria; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE tipo_categoria FROM PUBLIC;
REVOKE ALL ON TABLE tipo_categoria FROM postgres;
GRANT ALL ON TABLE tipo_categoria TO postgres;


--
-- Name: ubigeo; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE ubigeo FROM PUBLIC;
REVOKE ALL ON TABLE ubigeo FROM postgres;
GRANT ALL ON TABLE ubigeo TO postgres;


--
-- Name: unidad_medida; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE unidad_medida FROM PUBLIC;
REVOKE ALL ON TABLE unidad_medida FROM postgres;
GRANT ALL ON TABLE unidad_medida TO postgres;


--
-- PostgreSQL database dump complete
--

