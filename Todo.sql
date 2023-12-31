PGDMP      
        	        {            Todo    16.1 (Debian 16.1-1.pgdg120+1)    16.0     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    24908    Todo    DATABASE     q   CREATE DATABASE "Todo" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE "Todo";
                postgres    false            N           1247    25127    user_gender_enum    TYPE     K   CREATE TYPE public.user_gender_enum AS ENUM (
    'm',
    'f',
    'u'
);
 #   DROP TYPE public.user_gender_enum;
       public          postgres    false            �            1259    24909    todo    TABLE     �   CREATE TABLE public.todo (
    "ynCompleted" boolean DEFAULT true NOT NULL,
    "dtCreate" date NOT NULL,
    "dtDue" date NOT NULL,
    "todoId" integer NOT NULL,
    contents character varying(2000) NOT NULL
);
    DROP TABLE public.todo;
       public         heap    postgres    false            �            1259    25142    todo_todoId_seq    SEQUENCE     �   CREATE SEQUENCE public."todo_todoId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."todo_todoId_seq";
       public          postgres    false    215            +           0    0    todo_todoId_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."todo_todoId_seq" OWNED BY public.todo."todoId";
          public          postgres    false    218            �            1259    25134    user    TABLE     (  CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    username character varying(15) NOT NULL,
    email character varying(40) NOT NULL,
    age integer NOT NULL,
    password character varying NOT NULL,
    gender public.user_gender_enum NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false    846            �            1259    25133    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    217            ,           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    216            �           2604    25143    todo todoId    DEFAULT     n   ALTER TABLE ONLY public.todo ALTER COLUMN "todoId" SET DEFAULT nextval('public."todo_todoId_seq"'::regclass);
 <   ALTER TABLE public.todo ALTER COLUMN "todoId" DROP DEFAULT;
       public          postgres    false    218    215            �           2604    25137    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            !          0    24909    todo 
   TABLE DATA           V   COPY public.todo ("ynCompleted", "dtCreate", "dtDue", "todoId", contents) FROM stdin;
    public          postgres    false    215   #       #          0    25134    user 
   TABLE DATA           R   COPY public."user" (id, name, username, email, age, password, gender) FROM stdin;
    public          postgres    false    217   q       -           0    0    todo_todoId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."todo_todoId_seq"', 10, true);
          public          postgres    false    218            .           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    216            �           2606    25150 #   todo PK_32c10cf78b9d9301f7ea34e48af 
   CONSTRAINT     i   ALTER TABLE ONLY public.todo
    ADD CONSTRAINT "PK_32c10cf78b9d9301f7ea34e48af" PRIMARY KEY ("todoId");
 O   ALTER TABLE ONLY public.todo DROP CONSTRAINT "PK_32c10cf78b9d9301f7ea34e48af";
       public            postgres    false    215            �           2606    25141 #   user PK_cace4a159ff9f2512dd42373760 
   CONSTRAINT     e   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_cace4a159ff9f2512dd42373760";
       public            postgres    false    217            !   >   x�+�4202�54�5�Df�q���+r��P`Q`�S�D�1N�@8%��F\1z\\\ v�      #      x������ � �     