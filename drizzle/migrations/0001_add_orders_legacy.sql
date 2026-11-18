CREATE TABLE IF NOT EXISTS public.orders_legacy (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  customer_id uuid REFERENCES public.customers(id) ON DELETE SET NULL,
  phone text NOT NULL,
  name text, city text, amount text, details text, invoice_no text, method text,
  status text NOT NULL DEFAULT 'pending',
  decided_at timestamptz,
  created_at timestamptz NOT NULL DEFAULT now(),
  CONSTRAINT orders_legacy_pkey PRIMARY KEY (id)
);
GRANT ALL ON public.orders_legacy TO service_role;
ALTER TABLE public.orders_legacy ENABLE ROW LEVEL SECURITY;
COMMENT ON TABLE public.orders_legacy IS 'Unused old orders table, kept for its rows.';
CREATE INDEX IF NOT EXISTS orders_customer_id_idx ON public.orders(customer_id);